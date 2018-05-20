class User < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	has_secure_password
	has_many :characters
	has_many :klasses, through: :characters
	has_many :races, through: :characters
end