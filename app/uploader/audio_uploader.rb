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

  version :mp3 do
    process :convert => [{output_format: :mp3}]

    def full_filename(for_file)
      "#{super.chomp(File.extname(super))}.mp3"
    end
  end


  def extension_whitelist
    %w[mp3 ogg aac wma wav m4a MPEG-4]
  end


end
