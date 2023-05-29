# frozen_literal_string: true

require 'nokogiri'
require 'httparty'
require 'json'

def scraper_percentage_chage7d
  url = "https://br.investing.com/crypto/currencies"
  get_url = HTTParty.get(url)
  data = Nokogiri::HTML(get_url.body)

  table = data.css('tbody')
  rows = table.css('tr')

  results = []

  rows.take(10).each do |row|
    coin_name = row.css('.left.bold.elp.name.cryptoName.first.js-currency-name').text.strip
    var7 = row.css('.js-currency-change-7d.greenFont').text.strip

    acronym = row.css('.left.noWrap.elp.symb.js-currency-symbol').text.strip
    url_image = "https://i-invdn-com.investing.com/ico_flags/80x80/v32/#{coin_name.downcase}.png".gsub(' ','-')

    # result = {
    #   name: coin_name,
    #   percent_change_7d: var7,
    #   acronym: acronym,
    #   url_image: url_image
    # }

    # results << result

    crypto_currency = Coin.find_by(description: coin_name)
    Coin.create(description: coin_name, acronym: acronym, url_image: url_image, percentagechange7d: var7) unless crypto_currency

    if crypto_currency
      crypto_currency.update(acronym: acronym)
      crypto_currency.update(url_image: url_image)
      crypto_currency.update(percentagechange7d: var7)
    end
  end

  # puts JSON.pretty_generate(results)
end

# scraper_percentage_chage7d
