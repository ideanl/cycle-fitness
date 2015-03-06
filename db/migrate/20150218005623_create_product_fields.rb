class CreateProductFields < ActiveRecord::Migration
  def change
    remove_column :products, :name, :string
    add_column :products, :manufacturer, :string
    add_column :products, :model, :string
    add_column :products, :gender, :boolean
    add_column :products, :description, :text
    add_column :products, :size, :integer

    create_table :product_categories do |t|
      t.string :product_id
      t.string :category_id
    end

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
