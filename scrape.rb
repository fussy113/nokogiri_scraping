class Scrape
	require 'capybara'
	require 'capybara/dsl'
	require 'capybara/poltergeist'
	require_relative 'models/iidx_level12'
	require_relative 'models/iidx_level11'
	require_relative 'models/iidx_level10'
	require_relative 'models/iidx_level9'
	require_relative 'models/iidx_level8'

	include Capybara::DSL
	def initialize()
		Capybara.register_driver :poltergeist_debug do |app|
			Capybara::Poltergeist::Driver.new(app, :inspector => true)
		end

		Capybara.default_driver = :poltergeist
		Capybara.javascript_driver = :poltergeist
	end

	def iidx_scrape(table_name,url)
		page.driver.headers
		page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36" }
		page.driver.headers
		visit(url)

		#Nokogiriオブジェクトの作成
		doc = Nokogiri::HTML.parse(page.html)
		names = doc.css('b')
		names.each do |name|
			music = table_name.where(:name => name.inner_text).order('id desc').limit(1)[0]
			if music.nil?
				table_name.create(:name => name.inner_text)
				p name.inner_text
			end
		end
	end

	scrape = Scrape.new
	scrape.iidx_scrape(Iidx_Level8,'http://textage.cc/score/?s811B00')
	scrape.iidx_scrape(Iidx_Level9,'http://textage.cc/score/?s911B00')
	scrape.iidx_scrape(Iidx_Level10,'http://textage.cc/score/?sA11B00')
	scrape.iidx_scrape(Iidx_Level11,'http://textage.cc/score/?sB11B00')
	scrape.iidx_scrape(Iidx_Level12,'http://textage.cc/score/?sC11B00')

end