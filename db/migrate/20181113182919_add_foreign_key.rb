class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :products, :orders
  	add_foreign_key :products, :comments
  end
end
