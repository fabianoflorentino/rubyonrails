# frozen_string_literal: true

require "nokogiri"
require "httparty"


class ScrapperUrlCoin
  def scrapper_data_url(url)
    get_url = HTTParty.get(url)
    data_url = Nokogiri::HTML(get_url.body)

    data_url
  end

  def img_filter(url)
    data_url = scrapper_data_url(url)

    img_element = data_url.at_css('.cryptoTopColumn img')
    img_url = img_element['src']
  rescue NoMethodError
    "No data found for this url"
  end
end

# url = ScrapperUrlCoin.new
# puts url.img_filter("https://br.investing.com/crypto/bitcoin")
