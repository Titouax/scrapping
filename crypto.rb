require 'rubygems'
require 'nokogiri'
require 'open-uri'

def cryptomonnaies
  #Création d'un array qui recevra les nom des crypto
currency_name = []
#On ouvre la page et on selection les elements de classe ".currency-name-container"
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container").each do |item|
  #Pour chacun d'entre eux, on prend la valeur texte
  var = item.text
  #On l'ajoute dans l'array créer plus haut
  currency_name << var
end

#Création d'un array qui recevra les prix des crypto
currency_price = []
#On ouvre la page et on selection les elements de classe ".price"
page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price").each do |item|
  #Pour chacun d'entre eux, on prend la valeur texte
  var = item.text
  #On l'ajoute dans l'array créer plus haut
  currency_price << var
end
#On créer un hash dans lequel on zip les deux array qui contienne Nom et Prix
puts Hash[currency_name.zip(currency_price)]
end

cryptomonnaies
