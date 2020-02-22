# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings

  def self.counts
    self.select('name, count(taggings.tag_id) as count').joins(:taggings).group('name, taggings.tag_id')
  end
end
