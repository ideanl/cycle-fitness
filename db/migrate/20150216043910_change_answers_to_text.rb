class ChangeAnswersToText < ActiveRecord::Migration
  def change
    change_column :questions, :answer, :text
  end
end
