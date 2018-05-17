class CreateKlasses < ActiveRecord::Migration
	def change
		create_table :klasses do |t|
			t.string :name
		end
	end
end