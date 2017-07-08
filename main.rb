require 'telegram/bot'
require 'net/http/post/multipart'
token = '348650636:AAE1gJpiqKU8Muc-PaGspI_aKA22dFHZd0w'
text = "
Ты можешь использовать меня для поиска видео на ютубе,просто введи,что хочешь найти.      
/podbros_monetku-подбрасывает монетку
/hello - приветствие
        "
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message| 
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Я очень простой бот.Введи /help для помощи")
    when '/help'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: text
      )                	
    when '/hello'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Привет, #{message.from.first_name}.Как дела?")
    when '/podbros_monetku'
      if(rand(1..2) % 2==0)
      	bot.api.sendMessage(chat_id: message.chat.id, text: "Orel")
        bot.api.sendPhoto(chat_id: message.chat.id,photo: Faraday::UploadIO.new('5709-0001-1000x1000-w-50-50-50.jpg','image/jpeg'))
      else
      	bot.api.sendMessage(chat_id: message.chat.id, text: "Reshka")
        bot.api.sendPhoto(chat_id: message.chat.id,photo: Faraday::UploadIO.new('big.jpg','image/jpeg'))
      end
    else
    youtube = "https://www.youtube.com/results?search_query=#{message.text}"
    bot.api.send_message(chat_id: message.chat.id, text: "Watch #{youtube}") unless message.text
    end
    end
end
