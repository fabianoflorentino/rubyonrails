# frozen_literal_string: true

require "nokogiri"
require "httparty"
require "json"

class ScrapperCoin
  def scraper_data_coin
    url = "https://br.investing.com/crypto/currencies"
    get_url = HTTParty.get(url)
    data = Nokogiri::HTML(get_url.body)

    table = data.css("tbody")
    @rows = table.css("tr")

    @rows
  end

  def json_scraper_data_coin
    rows = scraper_data_coin

    rows.take(30).each do |row|
      @coin_name = row.css(".left.bold.elp.name.cryptoName.first.js-currency-name").text.strip
      @acronym = row.css(".left.noWrap.elp.symb.js-currency-symbol").text.strip
      @var7 = row.css(".js-currency-change-7d.greenFont", ".js-currency-change-7d.redFont").text.strip
      @url_image = "https://i-invdn-com.investing.com/ico_flags/80x80/v32/#{@coin_name.downcase}.png".gsub(" ", "-")

      results = {
        name: @coin_name,
        acronym: @acronym,
        var7: @var7,
        image: @url_image
      }

      puts JSON.pretty_generate(results)
    end
  end

  def db_scraper_data_coin
    crypto_currency = Coin.find_by(description: coin_name)
    Coin.find_or_create_by!(description: coin_name, acronym: acronym, url_image: url_image, percentagechange7d: var7)

    if crypto_currency
      crypto_currency.update(acronym: acronym)
      crypto_currency.update(url_image: url_image)
      crypto_currency.update(percentagechange7d: var7)
    end
  end
end

scrapper = ScrapperCoin.new
# scrapper.json_scraper_data_coin

scrapper.db_scraper_data_coin
