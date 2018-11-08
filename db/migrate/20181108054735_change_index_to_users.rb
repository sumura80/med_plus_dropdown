class ChangeIndexToUsers < ActiveRecord::Migration[5.1]
	def up
    remove_index :users, column: :email
    add_index :users, :email, unique: true, where: 'deleted_at IS NULL'
  end

  def down
    remove_index :users, column: :email
    add_index :users, :email, unique: true
  end
end
