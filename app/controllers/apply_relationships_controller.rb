class ApplyRelationshipsController < ApplicationController
  before_action :logged_in_user
  def create
    user = User.find(params[:userid])
    currentpost = RidePost.find(params[:postid])
    user.apply(currentpost)
    user.send_msgs.create do |msg|
      msg.sender_id = user.id
      msg.receiver_id = currentpost.user_id
      msg.content = "#{user.first_name} #{user.last_name} has applied for your ride."
    end
    redirect_to request.referrer
  end

  def destroy
    user = User.find(params[:userid])
    currentpost = RidePost.find(params[:postid])
    user.unapply(currentpost)
    driver = User.find(currentpost.user_id)
    driver.removepassenger(user)
    user.send_msgs.create do |msg|
      msg.sender_id = user.id
      msg.receiver_id = currentpost.user_id
      msg.content = "#{user.first_name} #{user.last_name} has just canceled the application to your ride."
    end
    redirect_to request.referrer
  end
end
