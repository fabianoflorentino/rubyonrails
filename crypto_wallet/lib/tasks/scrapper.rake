namespace :scrapper do

  require_relative 'scrappercoin'

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

  desc 'JSON data'
  task json_scraper_data_coin: :environment do
    scrapper = ScrapperCoin.new
    scrapper.json_scraper_data_coin
  end

  desc 'Database data'
  task db_scraper_data_coin: :environment do
    show_spinner 'Carregando dados...' do
      scrapper = ScrapperCoin.new
      scrapper.db_scraper_data_coin
    end
  end

  desc 'Database rebuild'
  task db_rebuild: :environment do
    show_spinner("Apagando BD...") { %x(rails db:drop) }
    show_spinner("Criando BD...") { %x(rails db:create) }
    show_spinner("Migrando BD...") { %x(rails db:migrate) }
    show_spinner 'Carregando dados...' do
      scrapper = ScrapperCoin.new
      scrapper.db_scraper_data_coin
    end
  end
end
