class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.boolean :draft, default: true
      t.boolean :published, default: false
      t.boolean :deleted, default: false
      t.belongs_to :group_event, foreign_key: true, index: true

      t.timestamps
    end
  end
end
