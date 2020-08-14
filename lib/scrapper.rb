require 'nokogiri'
require 'pry'
require 'open-uri'
require 'json'
require 'csv'
class Scrapper


def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{townhall_url}"))
  tab_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  tab_url = townhall_url[5..-6]
 { tab_url => tab_email }

end

def get_townhall_urls 
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  tab_name = page.xpath("//a[@class='lientxt']/@href")

  mon_tab = []
  tab_name.each do |link_of_url|
    
  mon_tab << get_townhall_email(link_of_url.text) 
end
  return mon_tab

 end

def save_JSON(mon_tab)
  File.open("db/emails.json", "w") do |f|
    f.write(JSON.pretty_generate(mon_tab))
  end
end

def save_CSV(mon_tab)
  CSV.open("db/emails.csv","wb") do |csv|
    mon_tab.each do |h|
      h.each do |h|
     csv << h
      end
    end
  end
end

def perform 
 mon_tab = get_townhall_urls
 save_JSON(mon_tab)
 save_CSV(mon_tab)
end

end