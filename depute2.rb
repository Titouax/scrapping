require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Attention, ce programme met un certain temps à s'exécuter, les puts dans les différentes sections
#Permettent de voir le programme avancer et enregistrer les elements en local
#avant de sortir un jolie hash en 3 seconde ...

def depute
  #Création de 3 array qui recevrons les url des pges, les noms et les emails
depute_page = []
depute_name = []
depute_mail = []
#On ouvre la page et on selectionne les elements contenant un lien correspondant à la page des députes
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).xpath("//ul[@class ='col3']//a/@href").each do |link|
  #On concatenne ce lien avec le début de l'url et on l'enregistre dans une nouvelle variable
  url = "http://www2.assemblee-nationale.fr#{link}"
  #On ajoute ce nouveau lien dans l'array créer plus haut
  depute_page << url
  #puts url
end
#Pour chacun des liens récupéré plus haut
  depute_page.each do |url|
    #On l'ouvre et on selection la valeur texte du Titre H1
  name = Nokogiri::HTML(open("#{url}")).css("h1").text
  #Que l'on ajoute à l'array créer plus haut pour les noms
  depute_name << name
  puts depute_name
end
#Pour chacun des liens récupéré plus haut
  depute_page.each do |email|
    #on l'ouvre et on selection les élements contenant l'email, on prend ici l'attribut Href de l'élement
  email = Nokogiri::HTML(open("#{email}")).xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd[4]/ul/li[1]/a/@href")
  #auquel on supprime le préfix mailto:
  email = email.to_s.delete_prefix!("mailto:")
  #Puis on l'ajoute à l'array créer plus haut pour les emails
  depute_mail << email
  puts depute_mail
end
#On zip les arrays afin d'avoir un jolie Hash 
puts Hash[depute_name.zip(depute_mail)]
end
depute
