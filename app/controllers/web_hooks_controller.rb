class WebHooksController < ApplicationController
  def telegram
    user_message = permitted_params[:text]
    user_id = permitted_params[:from][:id]
    chat_id = permitted_params[:from][:id]

    if DdosChecker.new(user_id).allow?
      chat = Chat.new(chat_id)
      chat.send_chat_action
      Bot.new(chat, User.find_or_create_by!(telegram_id: user_id), user_message).reply
    end

    render nothing: true
  end

  private

  def permitted_params
    params.require(:message).
      permit(:message_id,
             :text,
             from: [:id, :first_name, :last_name, :username],
             chat: :id)
  end
end
