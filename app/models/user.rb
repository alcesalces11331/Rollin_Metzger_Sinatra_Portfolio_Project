class User < ActiveRecord::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	has_secure_password
	validates :username, :email, :password, presence: true
	validates :username, :email, uniqueness: true
	validates :password, length: { in: 6..20,
		message: 'must be between 6-20'}
	
	has_many :characters
	has_many :klasses
	has_many :races
end