class ApproveRelationshipsController < ApplicationController
    before_action :logged_in_user
    def create
      user = User.find(params[:userid]) 
      currentpost = RidePost.find(params[:postid])
      if(currentpost.approving.count == currentpost.available_seat_number)
        flash[:danger] = "Your do not have enough seats for this applier!"
        redirect_to current_user
      else
      currentpost.approve(user)
      redirect_to current_user
      end
    end
    
    def destroy
    user = User.find(params[:userid]) 
    currentpost = RidePost.find(params[:postid])
    currentpost.unapprove(user)
    redirect_to current_user
    end
end
