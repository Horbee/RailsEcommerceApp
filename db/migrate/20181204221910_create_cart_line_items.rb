class CreateCartLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_line_items do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
