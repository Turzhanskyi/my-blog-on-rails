# frozen_string_literal: true

# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  tag_id     :integer
#
# Indexes
#
#  index_taggings_on_post_id  (post_id)
#  index_taggings_on_tag_id   (tag_id)
#
require 'rails_helper'

RSpec.describe Tagging, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
