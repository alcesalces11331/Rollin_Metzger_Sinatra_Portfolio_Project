class Klass < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	validates :name, :hitdie, :proficencies, :ability, presence: true
	belongs_to :character
	belongs_to :user
end