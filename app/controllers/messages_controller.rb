class MessagesController < ApplicationController
  
  def create
    @message = Message.new(body: params[:message][:body], user_id: session[:user_id])
    if @message.save
      flash[:success] = "Message is successfully uploaded"
      redirect_to root_path
    else
      flash[:error] = "Message can not be uploaded"
      redirect_to root_path
    end
  end
  
  
  
  private 
  
  def message_params
    params.require(:message).permit(:body)
  end
  
end