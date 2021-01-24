class AddLanguageIdToPalabras < ActiveRecord::Migration[6.0]
  def change
    add_reference :palabras, :language, index:true, foreign_key: true
  end
end
