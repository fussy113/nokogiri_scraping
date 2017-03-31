class Scrape
	require 'capybara'
	require 'capybara/dsl'
	require 'capybara/poltergeist'
	require 'pry'

	#DSLのスコープを別けないと警告がでます
	include Capybara::DSL
	def initialize()
		Capybara.register_driver :poltergeist_debug do |app|
			Capybara::Poltergeist::Driver.new(app, :inspector => true)
		end

		Capybara.default_driver = :poltergeist
		Capybara.javascript_driver = :poltergeist
	end

	def visit_site
		page.driver.headers # => {}
		#ユーザエージェントの設定（必要に応じて）
		page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36" }

		page.driver.headers
		visit('http://textage.cc/score/?a011B00')

		#Nokogiriオブジェクトの作成
		doc = Nokogiri::HTML.parse(page.html)
		names = doc.css('b')
		names.each do |name|
			p name.inner_text
		end
	end
	scrape = Scrape.new
	scrape.visit_site
end