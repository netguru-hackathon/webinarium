Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, AppConfig.github.client_id, AppConfig.github.client_secret
end
