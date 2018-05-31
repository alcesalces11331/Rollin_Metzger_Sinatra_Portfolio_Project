class Character < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	validates :name, :race, :klass, presence: true

	validates_associated :klass
	validates_associated :race

	belongs_to :user
end