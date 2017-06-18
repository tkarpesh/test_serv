class Chat
  def initialize(chat_id)
    @chat_id = chat_id
  end

  def send_chat_action(action = 'typing')
    client.send_chat_action(chat_id: @chat_id, action: action)
  end

  def send_message(text, keyboard: false)
    params = { chat_id: @chat_id, text: text }
    if keyboard.present?
      params.merge!(reply_markup: Telegrammer::DataTypes::ReplyKeyboardMarkup.new(keyboard: keyboard))
    elsif !keyboard.nil?
      params.merge!(reply_markup: Telegrammer::DataTypes::ReplyKeyboardHide.new)
    end
    client.send_message(params)
  end

  private

  def client
    $telegram_client ||=
      Telegrammer::Bot.new(Rails.application.secrets.telegram[:token])
  end
end