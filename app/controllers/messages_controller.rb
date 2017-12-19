class MessagesController < ApplicationController
  def create
    @msg = Message.new(msg_params)
    if @msg.save
      render :json => {status: "success", data: @msg}
    else
      render :json => {status: "fails", data: nil}
    end
  end

  def show
  end

  def show_convs
    @convs = Message.get_all_conv current_user.id.to_i
    render :json => {status: "success", data: @convs}
  end

  private
  def msg_params
    params.require(:msg).permit(:sender_id, :receiver_id, :content)
  end
end
