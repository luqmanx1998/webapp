class Interest < ApplicationRecord
    has_many :user_interests, dependent: :destroy
    has_many :users, through: :user_interests
    has_many :challenges, foreign_key: :challenge_type_id
end
