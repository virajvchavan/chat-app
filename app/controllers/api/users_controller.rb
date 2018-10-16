class Api::UsersController < ApplicationController
  def index
    render json: User.all.as_json(only: [:id, :username])
  end

  def create
    user = User.new(params[:id])
    if user.save
      render json: { message: 'saved user' }
    else
      render json: { message: 'error saving user' }
    end
  end

  def messages
    user = User.find(params[:id])
    render json: user.all_messages
  end

  def send_message
    user = User.find(params[:id])
    receiver = User.find(params[:receiver_id])
    Message.create(from: @user, to: receiver, content: params[:content])
    render json: { message: 'message sent!' }
  end

end
