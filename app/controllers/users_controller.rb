class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :change_status]
  before_action :correct_user, only: [:edit, :update]

  def index
  end

  def home

  end

  def change_status
    @user = current_user
    if @user.valid?
      @user.update_attributes({:status => !@user.status})
    end
    redirect_to @user
  end

  def new
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.status
      @ride_posts = @user.ride_posts.paginate(page: nil)
    else
      @ride_post_passengers = @user.applying.paginate(page: nil)
    end
  end

  def update
    # if !User.find_by(email: "#{params[:user][:email]}").nil?
    #   if params[:id] != User.find_by(email: "#{params[:user][:email]}").id.to_s
    #     @email_existed = true
    #   end
    # else
    #   @email_existed = false
    # end
    #
    # @user = User.find(params[:id])
    #
    # if @user.valid? && !@email_existed
    #   @user.update_attributes(user_params)
    #   render :json => { :updated? => true, :status => 200, :message => "Successful update!", :data => @user }
    # elsif @user.valid?
    #   render :json => { :updated? => false, :status => 200, :message => "Email entered has been used!", :data => @user }
    # else
    #   render :json => { :data => nil, :status => 200, :message => "Invalid user id!" }
    # end

    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "Welcome to UFreeRide! Please check your email to activate your account."
      redirect_to login_path
      # render :json => { :data => @user, :status => 200 }
    else
      # render :json => { :data => nil, :status => 200 }
      render 'new'
    end
  end

  # moved to application.controller.rb
  #def logged_in_user
    #unless logged_in?
      #store_location
      #flash[:danger] = "Please log in."
      #redirect_to login_url
    #end
  #end

  def correct_user
    @user = User.find(params[:id])
    #render :json => { :updated? => false, :status => 200, :message => "You are not allowed edit other users." } unless @user == current_user
    redirect_to(root_url) unless @user == current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname, :password, :password_confirmation, :email, :phone, :status, :gender)
    end

end
