# -*- encoding: utf-8 -*-
require 'pry'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/iidx_level8'
require_relative 'models/iidx_level9'
require_relative 'models/iidx_level10'
require_relative 'models/iidx_level11'
require_relative 'models/iidx_level12'
include Capybara::DSL

def initialize() Capybara.register_driver :poltergeist_debug do |app|
	Capybara::Poltergeist::Driver.new(app, :inspector => true)
end
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
end

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

get "/cook/:search" do
  cook_ary = Array.new(5,2)

  url = "https://cookpad.com/search/#{params[:search]}"
  #日本語url
	ja_url=URI.escape(url)
	page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36" }
	visit(ja_url)

	doc = Nokogiri::HTML.parse(page.html)

  doc.css('.recipe-title').children.each_with_index { |recipe,i |
		cook_ary[i,0] = recipe.text
    cook_ary[i,1] = recipe[:href]
  }
end