class Race < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	belongs_to :character
	belongs_to :user
end