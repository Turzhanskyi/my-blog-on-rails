# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :summary, :body, presence: true
end
