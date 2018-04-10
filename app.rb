# -*- encoding: utf-8 -*-
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/iidx_level8'
require_relative 'models/iidx_level9'
require_relative 'models/iidx_level10'
require_relative 'models/iidx_level11'
require_relative 'models/iidx_level12'

get "/" do
	"Hello!!"
end

get "/iidx_level8s" do
	Iidx_Level8.all.to_json # 全てのPostを返す
end

get "/iidx_level8s/random" do
	Iidx_Level8.order("RAND()").first.to_json
end

get "/iidx_level8s/:id" do
	Iidx_Level8.find(params[:id]).to_json
end

get "/iidx_level9s" do
	Iidx_Level9.all.to_json # 全てのPostを返す
end

get "/iidx_level9s/random" do
	Iidx_Level9.order("RAND()").first.to_json
end

get "/iidx_level9s/:id" do
	Iidx_Level9.find(params[:id]).to_json
end

get "/iidx_level10s" do
	Iidx_Level10.all.to_json # 全てのPostを返す
end

get "/iidx_level10s/random" do
	Iidx_Level10.order("RAND()").first.to_json
end

get "/iidx_level10s/:id" do
	Iidx_Level10.find(params[:id]).to_json
end

get "/iidx_level11s" do
	Iidx_Level11.all.to_json # 全てのPostを返す
end

get "/iidx_level11s/random" do
	Iidx_Level11.order("RAND()").first.to_json
end

get "/iidx_level11s/:id" do
	Iidx_Level11.find(params[:id]).to_json
end

get "/iidx_level12s" do
	Iidx_Level12.all.to_json # 全てのPostを返す
end

get "/iidx_level12s/random" do
	Iidx_Level12.order("RAND()").first.to_json
end

get "/iidx_level12s/:id" do
	Iidx_Level12.find(params[:id]).to_json
end