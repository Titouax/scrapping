require 'rubygems'
require 'nokogiri'
require 'open-uri'

=begin
def get_url
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
url = page.xpath("//ul[@class ='col3']//a/@href")
end

def get_email(url_depute)
doc =  Nokogiri::HTML(open("url_depute"))
email = doc.xpath(//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a)
email = email.to_s.delete_prefix!("mailto:")
end

depute
=end
