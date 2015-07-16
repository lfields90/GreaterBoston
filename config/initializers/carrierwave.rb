CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    AWS_ACCESS_KEY_ID: ENV["S3_KEY_ID"],
    AWS_ACCESS_SECRET_KEY_ID: ENV["S3_SECRET_KEY"]
  }
  config.fog_directory = ENV["S3_BUCKET"]
end
