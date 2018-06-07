class Character < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	belongs_to :user
	has_many :klasses
	has_many :races

	validates :name, :race, :klass, presence: true
	#validates :name, uniqueness: true,
		#if: Proc.new { |a| a.name.}

end