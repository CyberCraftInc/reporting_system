class CreateJoinTableMessagetypeMessage < ActiveRecord::Migration
  def change
    create_join_table :messagetypes, :messages do |t|
      # t.index [:messagetype_id, :message_id]
      # t.index [:message_id, :messagetype_id]
    end
  end
end
