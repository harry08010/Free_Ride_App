class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to current_user
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # if user.activated?
      if true
      log_in user
      #render :json => {:is_login? => true,:status => 200, :message => "Successful log in!", :data => user}
      redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
        #render :json => {:is_login? => false, :status => 200, :message => "Not activated yet!"}
      end
    else
      #render :json => {:is_login? => false, :status => 200, :message => "Invalid email/password combination!"}
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
      log_out if logged_in?
      redirect_to root_url
      #render :json => {:is_login? => false, :status => 200, :message => "Just log out!"}
  end

end
