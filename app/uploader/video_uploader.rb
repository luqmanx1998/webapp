class VideoUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay
  include CarrierWave::Video

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  PROCESSED_DEFAULTS = {

   resolution:           '1920x1080',

   video_codec:          'libx264', # H.264/MPEG-4 AVC video codec

   frame_rate:           '25', # frame rate

   audio_codec:          'aac', # AAC audio codec

   audio_bitrate:        '64k', # Audio bitrate

   audio_sample_rate:    '44100', # Audio sampling frequency

   scale:           '1920x1080',
   aspect: '1.7777777', 
   custom: %w(-vf scale=1920:1080:force_original_aspect_ratio=1,pad=1920:1080:(ow-iw)/2:(oh-ih)/2 )
 }

 process encode_video: [:mp4, PROCESSED_DEFAULTS ]

  def extension_whitelist
    %w[mov mp4 3gp mkv webm m4v avi]
  end


end
