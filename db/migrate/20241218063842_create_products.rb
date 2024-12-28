class CreateProducts < ActiveRecord::Migration[8.0]
  
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :tag
      t.string :string
      
      t.timestamps
    end
  end
end
class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end
  end
end

