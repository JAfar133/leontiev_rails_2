class CreateMeetings < ActiveRecord::Migration[7.1]
  def change
    create_table :meetings do |t|
      t.string :title
      t.date :date
      t.string :location
      t.text :description
      t.references :user, foreign_key: { on_delete: :cascade, on_update: :cascade }, index: true, null: false
      t.timestamps
    end
  end
end
