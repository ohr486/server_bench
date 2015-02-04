class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :group_id
      t.string :name
      t.integer :age

      t.timestamps null: false
    end
  end
end
