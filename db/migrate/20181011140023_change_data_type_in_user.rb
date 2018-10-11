class ChangeDataTypeInUser < ActiveRecord::Migration[5.2]
  def change
	def up
		change_column :users, :auth_key, :string
	end

	def down
		change_column :user, :auth_key, :integer
	end
  end
end
