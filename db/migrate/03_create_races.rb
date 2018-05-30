class CreateRaces < ActiveRecord::Migration[4.2]
	def change
		create_table :races do |t|
			t.string :name
			t.string :language
			t.string :bonus_1
			t.string :bonus_2
			t.string :abs_1
			t.string :abs_2
			t.integer :user_id
		end
	end
end