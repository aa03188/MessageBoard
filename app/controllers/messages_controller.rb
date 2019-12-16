class MessagesController < ApplicationController
  # run show to set the message before the other methods as well
  before_action :show, only: [:edit, :update, :destroy]

  # index page of all messages in order by when they were created
  def all
    @messages = Message.all.order("created_at DESC")
  end

  # create a new message
  def new
    @message = current_user.messages.build
  end

  # show message by the id in the params "/id in the url"
  def show
    @message = Message.find(params[:id])
  end

  # method to create a new message with the POST params
  def create
    @message = current_user.messages.build(getMessageContent)

    # redirect to the message that was created
    if @message.save
      redirect_to @message
    else
      # empty, redirect to new again
      render 'new'
    end
  end

  # edit message method (for view)
  def edit
  end

  # update the user's message
  def update
    # don't allow different users to edit messages that aren't theirs
    if @message.user.id == current_user.id
    # if update is called with the content parameter
      if @message.update(getMessageContent)
        # redirect to the updated message
        redirect_to @message
      else
        # empty, redirect to edit again
        render 'edit'
      end
    end
  end

  # delete the message
  def destroy
    # don't allow different users to delete messages that aren't theirs
    if @message.user.id == current_user.id
      @message.destroy

      # redirect to the root_path after deleting the message
      redirect_to root_path
    end
  end

  # here starts the protected methods
  protected

  # get the message content parameter
  def getMessageContent
    params.require(:message).permit(:content)
  end
end
