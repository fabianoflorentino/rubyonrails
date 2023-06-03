require_relative "../../app/sidekiq/getdatacoin_job"

Sidekiq.configure_server do |config|
  config.redis = { url: REDIS_URL }
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end

GetdatacoinJob.perform_in(10.minutes)
