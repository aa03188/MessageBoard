class RepliesController < ApplicationController
  # create a reply to a message
  def create
    # get current on message id, and create a reply with the content in the params
    @message = Message.find(params[:message_id])
    @reply = @message.replies.create(params[:reply].permit(:content))
    @reply.user_id = current_user.id

    # save the reply
    @reply.save

    # redirect to the message if the reply was saved
    if @reply.save
      redirect_to message_path(@message)
    else
      # empty, redirect to the message
      redirect_to message_path(@message)
    end
  end

  # delete reply
  def destroy
    # find the reply to destroy and set it as a variable
    @message = Message.find(params[:message_id])
    @reply = @message.replies.find(params[:id])

    # destroy/delete the reply & redirect to the message again
    @reply.destroy
    redirect_to message_path(@message)
  end
end
