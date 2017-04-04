# -*- encoding: utf-8 -*-
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/iidx_level10'

get "/" do
	"Hello Heroku!!"
end

get "/iidx_level10s" do
	Iidx_Level10.all.to_json # 全てのPostを返す
end

get "/iidx_level10s/random" do
	id = rand(Iidx_Level10.count) + 1
	Iidx_Level10.find(id).to_json
end

get "/iidx_level10s/:id" do
	Iidx_Level10.find(params[:id]).to_json
end

