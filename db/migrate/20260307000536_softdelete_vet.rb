class SoftdeleteVet < ActiveRecord::Migration[8.1]
  def change
     add_column :veterinarians, :is_deleted, :boolean
  end
end
