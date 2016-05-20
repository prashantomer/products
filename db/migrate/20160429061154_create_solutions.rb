class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :solution, null: false
      t.integer :solution_id
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
