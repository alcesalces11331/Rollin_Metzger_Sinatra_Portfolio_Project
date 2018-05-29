class Klass < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	validates :name, :hitdie, :proficiencies, :ability, presence: true
	belongs_to :character
	belongs_to :user
end