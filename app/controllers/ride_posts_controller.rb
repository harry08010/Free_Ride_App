class RidePostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def create
    @ride_post = current_user.ride_posts.build(ride_post_params)
    if @ride_post.save
      # flash[:success] = "New post created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def new
    @ride_post = current_user.ride_posts.build if logged_in?
  end

  def destroy
    @ride_post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer
  end

  def index
    @ride_posts = RidePost.all
    if params[:starting_point].present? || params[:destination].present?
      @ride_posts = @ride_posts.where("user_id != ?", current_user.id)
      @ride_posts = @ride_posts.starting_points(params[:starting_point]).order("created_at DESC")
      @ride_posts = @ride_posts.destinations(params[:destination]).order("created_at DESC")
    #elsif params[:starting_point].present?
     # @ride_posts = @ride_posts.starting_points(params[:starting_point]).order("created_at DESC")
    #elsif params[:destination].present?
     # @ride_posts = @ride_posts.destinations(params[:destination]).order("created_at DESC")
    else
      @ride_posts = RidePost.all.where("user_id != ?", current_user.id).order("created_at DESC")
    end
  end

  def lock
    @ride_post = RidePost.find(params[:id])
    @ride_post.update_attributes(locked: true)
    @driver = User.find(@ride_post.user_id)
    @ride_post.approving.all.each do |approving|
      @driver.addpassenger(approving)
    end
    redirect_to request.referrer
  end

  private

  def ride_post_params
    params.require(:ride_post).permit(:starting_point, :destination, :available_seat_number, :date, :time, :note)
  end

  def correct_user
    @ride_post = current_user.ride_posts.find_by(id: params[:id])
    redirect_to current_user if @ride_post.nil?
  end
end
