class User < ActiveRecord::Base
	has_many :characters
	has_many :klasses, through: :characters
	has_many :races, through: :characters
end