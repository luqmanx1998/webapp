class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :fix_exif_rotation
  process resize_to_fit: [1920, 1080]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def fix_exif_rotation
    manipulate! do |img|
      img.tap(&:auto_orient)
    end
  end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

end
