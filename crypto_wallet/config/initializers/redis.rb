
REDIS_URL = "redis://rubyonrails_devcontainer-redis-1:6379/0"

$redis = Redis.new({ url: REDIS_URL })
