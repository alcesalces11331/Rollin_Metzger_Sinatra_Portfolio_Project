class AddUserIdToKlasses < ActiveRecord::Migration[4.2]
	def change
		add_column :klasses, :user_id, :int
	end
end