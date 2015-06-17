class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @messages = Message.all
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    @user = User.find(params[:user_id])
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:userSent, :userReceive, :message, :createdAt)
    end
end
