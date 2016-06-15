class CreateMessagetypes < ActiveRecord::Migration
  def change
    create_table :messagetypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
