class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  # 0) routes.rb directs localhost:3000/messages/new to this method
  # 1) This method creates a new @message
  # 3) @message is passed to app/view/messages/new.erb,
  #     where the form_for creates a form with the fields of the @message object.
  #     The variables for of @message can be used, but it's not used inside the form_for.
  #     We probably created this @message b/c form_for must take a non-nil argument.
  # 4) Pressing the "Create" button runs the f.submit method.
  # 5) Running 'f.submit' on messages/new.erb POSTs to /messages & passes :message & :content
  # 6) which according to routes.rb, redirects to 'messages#create' here
  # 7) Here, 'create'  action uses the message_params method to safely collect data from the form_for
  # 8) Using message_params, it initializes & saves a new @message

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
