class Character < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	belongs_to :user
	has_many :klasses
	has_many :races

	validates :name, :race, :klass, presence: true
	
	#def unique_checkbox
		#errors.add(:base, "Select Only One Class") if ...
	#end
end