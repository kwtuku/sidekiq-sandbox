require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

if Rails.env.production?
  Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
    [user, password] == [ENV['SIDEKIQ_BASIC_AUTH_USER'], ENV['SIDEKIQ_BASIC_AUTH_PASSWORD']]
  end
end
