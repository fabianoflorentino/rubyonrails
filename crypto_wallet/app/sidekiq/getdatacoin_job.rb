class GetdatacoinJob
  include Sidekiq::Job
  require_relative "../../lib/tasks/scrappercoin"

  def perform(*args)
    # Do something
    scrapper = ScrapperCoin.new
    scrapper.db_scraper_data_coin(100)
  end
end
