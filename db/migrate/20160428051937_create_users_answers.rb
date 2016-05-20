class CreateUsersAnswers < ActiveRecord::Migration
  def change
    create_table :users_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :answer

      t.timestamps null: false
    end
  end
end
