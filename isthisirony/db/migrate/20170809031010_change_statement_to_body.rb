class ChangeStatementToBody < ActiveRecord::Migration[5.1]
  def change
    remove_column :statements, :statement, :string
    add_column :statements, :body, :string
  end
end
