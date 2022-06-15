class User < ApplicationRecord
  has_many :posts, foreign_key: :create_user_id, primary_key: :id, dependent: :destroy
  belongs_to :create_user, class_name: 'User', foreign_key: 'create_user_id'
  belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'

  has_secure_password

  acts_as_paranoid

  has_one_attached :profile

  attr_accessor :old_password
  attr_accessor :remember_me

end
