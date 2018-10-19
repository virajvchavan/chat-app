class Api::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: User.all.as_json(only: [:id, :username])
  end

  def create
    user = User.find_or_initialize_by(username: params[:username])
    if user.save
      render json: { id: user.id }
    else
      render json: { id: nil }
    end
  end

  def messages
    user = User.find(params[:id])
    render json: user.all_messages(params[:other_user_id])
  end

  def send_message
    user = User.find(params[:id])
    receiver = User.find(params[:receiver_id])
    Message.create(from: user, to: receiver, content: params[:content])
    render json: { message: 'message sent!' }
  end

end
