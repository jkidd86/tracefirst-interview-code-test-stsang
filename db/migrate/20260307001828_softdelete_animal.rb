class SoftdeleteAnimal < ActiveRecord::Migration[8.1]
  def change
     add_column :animals, :is_deleted, :boolean
  end
end
