# frozen_string_literal: true

require "nokogiri"
require "httparty"
require "json"

SCRAPPER_URL = "https://br.investing.com/crypto/currencies"
SCRAPPER_URL_COIN = "https://br.investing.com/crypto"
SCRAPPER_IMG_URL = "https://i-invdn-com.investing.com/ico_flags/80x80/v32"

class CoinDTO
  attr_reader :coin_name, :acronym, :var7, :url_image

  def initialize(coin_name, acronym, var7, url_image)
    @coin_name = coin_name
    @acronym = acronym
    @var7 = var7
    @url_image = url_image
  end
end

# Scrapper Coin
class ScrapperCoin
  def scraper_data_coin
    url = SCRAPPER_URL
    get_url = HTTParty.get(url)
    data = Nokogiri::HTML(get_url.body)

    table = data.css("tbody")
    @rows = table.css("tr")

    @rows
  end

  def scrapper_filter(row)
    coin_name = row.css(".left.bold.elp.name.cryptoName.first.js-currency-name").text.strip
    acronym = row.css(".left.noWrap.elp.symb.js-currency-symbol").text.strip
    var7 = row.css(".js-currency-change-7d.greenFont", ".js-currency-change-7d.redFont").text.strip
    url_image = "#{SCRAPPER_IMG_URL}/#{coin_name.downcase}.png".tr(" ", "-")

    url_consult = HTTParty.get(url_image)
    if url_consult.code >= 400
      url_image = "#{SCRAPPER_IMG_URL}/#{coin_name.downcase}-new.png".tr(" ", "-")
    end

    CoinDTO.new(coin_name, acronym, var7, url_image)
  end

  def json_scraper_data_coin(numer_of_coins)
    rows = scraper_data_coin

    rows.take(numer_of_coins).map do |row|
      coin_filter = scrapper_filter(row)

      {
        name: coin_filter.coin_name,
        acronym: coin_filter.acronym,
        var7: coin_filter.var7,
        image: coin_filter.url_image
      }
    end
  end

  def db_scraper_data_coin(numer_of_coins)
    rows = scraper_data_coin

    rows.take(numer_of_coins).each do |row|
      coin_filter = scrapper_filter(row)

      crypto_currency = Coin.find_or_initialize_by(description: coin_filter.coin_name)

      crypto_currency.attributes = {
        acronym: coin_filter.acronym,
        url_image: coin_filter.url_image,
        percentagechange7d: coin_filter.var7
      }

      crypto_currency.save!
    end
  end
end
