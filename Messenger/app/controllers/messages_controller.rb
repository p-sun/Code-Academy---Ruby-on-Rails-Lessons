class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  # 0) routes.rb directs localhost:3000/messages/new to this method
  # 1) This method creates a new @message
  # 3) @message is passed to app/view/messages/new.erb. Its form_for ensures @message is not nil.
  # 4) Pressing the "Create" button runs the f.submit method.
  # 5) Running 'f.submit' on messages/new.erb POSTs to /messages & passes :message & :content
  # 6) which according to routes.rb, redirects to 'messages#create' here
  # 7) Here, 'create' checks that :message exists & :content is allowed through, & it initializes a @message
  #     I'm not sure why @message was initialized in 'new' and in 'create'
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save            # if successfully saved
      redirect_to '/messages'     # Open fresh page
    else
      render 'new'                # Otherwise reload '/messages/new' w the same POST as before?
    end
  end

  private
  def message_params
    params.require(:message).permit(:content) # Params from 'messages/new.erb'
  end

end
