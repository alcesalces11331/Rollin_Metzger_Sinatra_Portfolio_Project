require_relative '../models/concerns/slugifiable.rb'
require './config/environment'
require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "rollaD20"
		use Rack::Flash
	end

	get '/' do
		erb :index
	end


	helpers do

		def current_user
			@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
		end

		def logged_in?
			!!current_user
		end

		
		
	end
end