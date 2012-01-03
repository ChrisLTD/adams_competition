CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAI3XYHBL4DXAAC5AA',       # required
    :aws_secret_access_key  => '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',       # required
  }
  config.fog_directory  = 'adamscompetition'                     # required

  config.storage = :fog
end