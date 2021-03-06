if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      #Amazon S3
      :provider => "AWS",
      :region => ENV["S3_region"],
      :aws_access_key_id => ENV["S3_ACCESS_KEY"],
      :aws_secret_key_id => ENV["S3_SECRET_KEY"]
    }
    config.fog_directory = ENV["S3_BUCKET"]
  end
end
