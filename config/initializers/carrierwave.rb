unless Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['aws_access_key_id'],
        aws_secret_access_key: ENV['aws_secret_access_key'],
        region: 'ap-northeast-1'
      }
      config.fog_directory  = 'skilleroe'
      config.cache_storage = :fog
    end
  end