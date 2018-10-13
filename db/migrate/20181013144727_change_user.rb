class ChangeUser < ActiveRecord::Migration[5.2]
  def change
	change_table :users do |t|
		t.string :email
		t.string :username
		t.string :nickname
	end
  end
end
