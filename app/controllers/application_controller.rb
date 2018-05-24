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

	private

	helpers do

		def current_user
			@current_user ||= User.find(session[:id]) if session[:id]
		end

		def logged_in?
			!!current_user
		end

	end
end