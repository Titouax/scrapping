require 'rubygems'
require 'nokogiri'
require 'open-uri'

def depute
depute_page = []
depute_name = []
depute_mail = []
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).xpath("//ul[@class ='col3']//a/@href").each do |link|
  url = "http://www2.assemblee-nationale.fr#{link}"
  depute_page << url
  #puts url
end

  depute_page.each do |url|
  name = Nokogiri::HTML(open("#{url}")).css("h1").text
  depute_name << name
  puts depute_name
end

  depute_page.each do |email|
  email = Nokogiri::HTML(open("#{email}")).xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd[4]/ul/li[1]/a/@href")
  email = email.to_s.delete_prefix!("mailto:")
  depute_mail << email
  puts depute_mail
end
puts Hash[depute_name.zip(depute_mail)]
end
depute
