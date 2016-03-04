class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :salt
      t.integer :color1
      t.integer :color2
      t.integer :color3
    end
  end
end
