# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :post
      t.belongs_to :tag

      t.timestamps
    end
  end
end
