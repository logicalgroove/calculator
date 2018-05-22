class User < ApplicationRecord
  has_many :calculations, foreign_key: :user_id, class_name: 'Calculator'
end
