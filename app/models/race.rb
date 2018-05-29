class Race < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	validates :name, :language, :bonus_1, :bonus_2, :abs_1, :abs_2, presence: true
	belongs_to :character
	belongs_to :user
end