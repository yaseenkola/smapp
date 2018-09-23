class ChangeIntegerLimitInStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :card_no, :integer, limit: 8
  end
end
