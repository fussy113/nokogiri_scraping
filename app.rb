# -*- encoding: utf-8 -*-
require 'sinatra'
require 'line/bot'

def client
	@client ||= Line::Bot::Client.new do |config|
		config.channel_secret = ENV['CHANNEL_SECRET']
		config.channel_token  = ENV['CHANNEL_ACCESS_TOKEN']
	end
end

get '/' do 'Hello Heroku!' end

post '/linebot/callback' do
	body      = request.body.read

	# LINEからのリクエストか判定する
	signature = request.env['HTTP_X_LINE_SIGNATURE']
	unless client.validate_signature(body, signature)
		error 400 do 'Bad Request' end
	end

	events = client.parse_events_from(body)
	events.each do |event|
		case event
			when Line::Bot::Event::Follow
				message = Message::create_gen_message(event['source']['userId'])
				client.reply_message(event['replyToken'], message)
			when Line::Bot::Event::Message # メッセージイベントの場合 event.type の中身を見る
				case event.type.downcase
					when Line::Bot::Event::MessageType::Text
				end
						client.reply_message(event['replyToken'], message)
		end
	end

	'OK'
end
