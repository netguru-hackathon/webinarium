Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    AppConfig.google.api_key,
    AppConfig.google.api_secret,
    scope: "userinfo.email,userinfo.profile",
    approval_prompt: "auto",
    access_type: "online",
    hd: 'netguru.co'
  if Rails.env.development?
    provider :developer
  end
end
