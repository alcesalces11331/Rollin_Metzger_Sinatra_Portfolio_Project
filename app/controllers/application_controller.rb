require_relative '../models/concerns/slugifiable.rb'
require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		set :session_secret, "rollaD20"
		register Sinatra::Flash
		enable :sessions
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


		def login_validate
			redirect '/' if !logged_in?
		end
		
	end
end