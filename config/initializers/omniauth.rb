Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  #provider :google, CONSUMER_KEY, CONSUMER_SECRET
end
