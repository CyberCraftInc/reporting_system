class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.string :type
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
