# frozen_string_literal: true

require "nokogiri"
require "httparty"
require "json"

# Constant with URLs address to scrap data from website.
SCRAPPER_URL = "https://br.investing.com/crypto/currencies"
SCRAPPER_URL_COIN = "https://br.investing.com/crypto"
SCRAPPER_IMG_URL = "https://i-invdn-com.investing.com/ico_flags/80x80/v32"

# DTO Class
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
    @url_image = "#{SCRAPPER_IMG_URL}/#{coin_name.downcase}.png".tr(" ", "-")

    begin
      # Array of the image extensions
      img_name_extension = ["new", "ape"]

      # Loop to test URLs with image extensions
      img_name_extension.each do |extn|
        url_consult = HTTParty.get("#{SCRAPPER_IMG_URL}/#{coin_name.downcase}-#{extn}.png".tr(" ", "-"))

        # If URL is valid, then variable is populate with the URL with extension.
        if url_consult.code.between?(200, 226)
          @url_image = "#{SCRAPPER_IMG_URL}/#{coin_name.downcase}-#{extn}.png".tr(" ", "-")
        end
      end
    # Capture if timeout occurs
    rescue Net::OpenTimeout
      "Failed to open TCP connection to: #{@url_image}"
    end

    # Instance new object with coin data
    CoinDTO.new(coin_name, acronym, var7, @url_image)
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

    # Cleanup coin register in database
    Coin.in_bataches(batch_size: 10).destroy_all

    # Register or Update coins in database
    rows.take(numer_of_coins).each do |row|
      coin_filter = scrapper_filter(row)

      crypto_currency = Coin.in_batches(batch_size: 50).find_or_initialize_by(description: coin_filter.coin_name)

      crypto_currency.attributes = {
        acronym: coin_filter.acronym,
        url_image: coin_filter.url_image,
        percentagechange7d: coin_filter.var7
      }

      crypto_currency.save!
    end
  end
end
