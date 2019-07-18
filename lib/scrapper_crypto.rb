require 'nokogiri'   
require 'open-uri'
require 'pry'



def scraper
page_url = "https://coinmarketcap.com/all/views/all/"
page = Nokogiri::HTML(open(page_url))
crypto_listing=page.css("tr")
crypto_total_count = crypto_listing.count



  array = []
  crypto_listing.each do |n| 
      hash = {
          n.css('a.currency-name-container.link-secondary').text =>
          n.css('a.price').text
      }
      array << hash
      
    end
    return array
end
 scraper
