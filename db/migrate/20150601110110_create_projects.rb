class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :founder
      t.string :img_file
    end
  end
end
