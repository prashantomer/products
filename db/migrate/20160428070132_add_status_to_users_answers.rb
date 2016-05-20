class AddStatusToUsersAnswers < ActiveRecord::Migration
  def change
    add_column :users_answers, :status, :boolean, :default => false
  end
end
