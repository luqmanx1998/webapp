class AudioUploader < CarrierWave::Uploader::Base
  include CarrierWave::Audio
  include ::CarrierWave::Backgrounder::Delay


  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

    process :convert => [{output_format: :mp3}]

 


  def extension_whitelist
    %w[mp3 ogg aac wma wav m4a MPEG-4]
  end


end
