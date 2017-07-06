require 'telegram/bot'
require 'net/http/post/multipart'
token = '348650636:AAE1gJpiqKU8Muc-PaGspI_aKA22dFHZd0w'
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/help'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "
/podbros_monetku подбрасывает монетку
/hello Приветствует)
        "
      )    	
    when '/hello'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/podbros_monetku'
      if(rand(1..2) % 2==0)
      	bot.api.sendMessage(chat_id: message.chat.id, text: "Orel")
        bot.api.sendPhoto(chat_id: message.chat.id,photo: Faraday::UploadIO.new('5709-0001-1000x1000-w-50-50-50.jpg','image/jpeg'))
      else
      	bot.api.sendMessage(chat_id: message.chat.id, text: "Reshka")
        bot.api.sendPhoto(chat_id: message.chat.id,photo: Faraday::UploadIO.new('big.jpg','image/jpeg'))
    end
end

  end
end
