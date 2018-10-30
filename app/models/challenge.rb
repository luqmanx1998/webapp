class Challenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge_type, class_name: :Interest, foreign_key: :challenge_type_id
  has_many :posts, as: :submission, class_name: 'Post'


  #Uploader
  mount_uploader :cover, ChallengeCoverUploader

  
end
