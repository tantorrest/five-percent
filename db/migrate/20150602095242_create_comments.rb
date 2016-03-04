class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :name
      t.integer :list_id
      t.date :date_time
      t.string :file_name
    end
  end
end
