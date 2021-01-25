# frozen_string_literal: true

class CreatePalabras < ActiveRecord::Migration[6.0]
  def change
    create_table :palabras do |t|
      t.string :content

      t.timestamps
    end
  end
end
