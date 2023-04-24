class AddColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_delete, :boolean, default: false
  end
end
