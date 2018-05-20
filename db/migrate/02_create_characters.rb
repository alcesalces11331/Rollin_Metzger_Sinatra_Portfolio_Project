class CreateCharacters < ActiveRecord::Migration[4.2]
	def change
		create_table :characters do |t|
			t.string :name
			t.string :race
			t.string :klass
			t.integer :str
			t.integer :con
			t.integer :dex
			t.integer :wis
			t.integer :int
			t.integer :cha
			t.integer :user_id
		end
	end
end