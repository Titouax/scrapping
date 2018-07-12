require 'rubygems'
require 'nokogiri'
require 'open-uri'

def cryptomonnaies
currency_name = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container").each do |item|
  var = item.text
  currency_name << var
end

currency_price = []
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |item|
  var = item.text
  currency_price << var
end
puts Hash[currency_name.zip(currency_price)]
end
cryptomonnaies
