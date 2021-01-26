class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.references :palabra, index: true
      t.references :translated_palabra, index: true
      t.timestamps
    end
    add_foreign_key :translations, :palabras, column: :palabra_id
    add_foreign_key :translations, :palabras, column: :translated_palabra_id
  end
end
