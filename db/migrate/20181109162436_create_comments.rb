class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :title
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end
end
