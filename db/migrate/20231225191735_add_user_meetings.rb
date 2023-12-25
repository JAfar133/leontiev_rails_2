class AddUserMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :user_meetings do |t|
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.references :meeting, foreign_key: { on_delete: :cascade, on_update: :cascade }
      t.index ["user_id", "meeting_id"], :unique => true
    end
  end
end
