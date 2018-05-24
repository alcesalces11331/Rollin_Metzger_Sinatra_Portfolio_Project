class CreateKlasses < ActiveRecord::Migration[4.2]
	def change
		create_table :klasses do |t|
			t.string :name
			t.string :hitdie
			t.string :proficencies
			t.string :ability
		end
	end
end