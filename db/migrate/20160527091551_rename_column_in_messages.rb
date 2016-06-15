class RenameColumnInMessages < ActiveRecord::Migration
  def change
  	rename_column :messages, :type, :category
  end
end
