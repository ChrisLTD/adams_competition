CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads" # required to work on Heroku
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['S3_KEY'],       # required
    :aws_secret_access_key  => ENV['S3_SECRET'],       # required
  }
  config.fog_directory  = 'adamscompetition'                     # required

  config.storage = :fog
end