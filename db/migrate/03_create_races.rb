class CreateRaces < ActiveRecord::Migration
	def change
		create_table :races do |t|
			t.string :name
			t.string :language
			t.integer :abs_1
			t.integer :abs_2
		end
	end
end