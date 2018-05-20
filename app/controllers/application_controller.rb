require_relative '../models/concerns/slugifiable.rb'
require './config/environment'
require 'sinatra/base'

class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "rollaD20"
	end

	get '/' do
		erb :index
	end

	helpers do

		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end