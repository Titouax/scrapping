require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrap
  #on créer une liste qui recevra url et email
  list = {}
  #On ouvre la page
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  #News_link recevra les elements lien de classe "lientxt"
  news_links = page.css("a").select{|link| link['class'] == "lientxt"}
  #Pour chacun d'entre eux
  news_links.each{|link|
    #on concatenne avec le début de l'url
   url = "http://annuaire-des-mairies.com#{link['href'] }"
   #pour chacun des nouveau liens créer juste avant
   link.each {|email|
     #on l'ouvre
    page = Nokogiri::HTML(open(url))
    #on selection l'elements de la page qui contient l'email AKA tr[4]/td[2] en version texte
    email = page.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    #On fusionne les url avec les email dans le hash crér en haut du programme en indiquant le noms des clefs
    list.merge!(lien_url: url, email: email)
  }
  #On affiche notre jolie Hash 
  puts list
}
end
scrap
