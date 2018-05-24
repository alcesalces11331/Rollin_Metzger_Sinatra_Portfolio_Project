class User < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	has_secure_password
	validates :username, :email, :password, presence: true
	
	has_many :characters
	has_many :klasses
	has_many :races
end