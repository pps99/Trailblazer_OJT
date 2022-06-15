# frozen_string_literal: true

class Post < ApplicationRecord
  # soft-delete
  acts_as_paranoid

  belongs_to :create_user, class_name: 'User', foreign_key: 'create_user_id'
  belongs_to :updated_user, class_name: 'User', foreign_key: 'updated_user_id'
  require 'csv'
end
