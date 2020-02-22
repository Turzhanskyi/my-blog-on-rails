# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  image       :string
#  summary     :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :category

  validates :title, :summary, :body, presence: true

  def all_tags
    tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
