Sidekiq.configure_server do |config|
  schedule_file = "../../config/sidekiq.yml"

  config.redis = { url: REDIS_URL }

  if File.exist?(schedule_file)
    config.on(:startup) do
      Sidekiq.schedule = YAML.load_file(File.expand_path(schedule_file, __FILE__))
      SidekiqScheduler::Scheduler.instance.reload_schedule!
    end
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: REDIS_URL }
end
