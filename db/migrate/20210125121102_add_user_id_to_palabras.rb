# frozen_string_literal: true

class AddUserIdToPalabras < ActiveRecord::Migration[6.0]
  def change
    add_reference :palabras, :user, index: true, foreign_key: true
  end
end
