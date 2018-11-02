class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :anonymous_author
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
