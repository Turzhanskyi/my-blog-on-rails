# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary, :body, presence: true
end
