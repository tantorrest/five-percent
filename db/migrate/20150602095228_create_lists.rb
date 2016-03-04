class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :starter
      t.integer :project_id
      t.date :date_time
    end
  end
end
