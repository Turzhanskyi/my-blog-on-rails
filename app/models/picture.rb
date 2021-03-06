# frozen_string_literal: true

# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
end
