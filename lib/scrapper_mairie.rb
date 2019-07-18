require 'nokogiri'   
require 'open-uri'
require 'pry'

def townhall_url(page_url)
  page = Nokogiri::HTML(open(page_url))
  city_listing=page.css('table.Style20')

  a=city_listing.css('a.lientxt')
  arr=[]
  a.map{|link| arr << "http://annuaire-des-mairies.com#{link['href'].sub('.','')}"}
return arr

end
 

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(open(townhall_url))
  puts hash ={"#{page.xpath('/html[1]/body[1]/div[1]/main[1]/section[2]/div[1]/table[1]/tbody[1]/tr[4]/td[2]').text}" => "#{page.xpath('/html[1]/body[1]/div[1]/main[1]/section[1]/div[1]/div[1]/div[1]/p[1]/strong[1]/a[1]').text}"}
  return hash     
end


def get_all_email
  page_url = "http://annuaire-des-mairies.com/val-d-oise.html"
  arr=[]   
    townhall_url(page_url).map{|link| 
    arr << get_townhall_email(link)
    get_townhall_email(link)
    }
    return arr
end
get_all_email
 









