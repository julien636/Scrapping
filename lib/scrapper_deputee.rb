require 'nokogiri'   
require 'open-uri'
require 'pry'

   


def deputee_url
page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
deputee_listing=page.css('div.list_table a')
arr=[]
deputee_listing.map{|link| arr << "https://www.nosdeputes.fr#{link['href'].sub('.','')}"}
return arr

end

 

def get_deputee_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    hash=Hash.new
    hash = {"email" => "#{page.xpath("/html[1]/body[1]/div[1]/div[5]/div[1]/div[2]/div[1]/ul[2]/li[1]/ul[1]/li[1]/a[1]").text}", "name" => "#{page.xpath("/html[1]/body[1]/div[1]/div[5]/div[1]/div[1]/div[1]/h1[1]").text.split(' ', 2)[0]}", "last_name" => "#{page.xpath("/html[1]/body[1]/div[1]/div[5]/div[1]/div[1]/div[1]/h1[1]").text.split(' ', 2)[1]}" }
    return hash
    
end



def get_all_email
    arr=[]   
    deputee_url.map{|link| arr << 
    get_deputee_email(link)
    puts get_deputee_email(link)
    }
    puts arr
end

get_all_email


    
 









