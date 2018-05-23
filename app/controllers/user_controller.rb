require 'pry'
class UserController < ApplicationController

	get '/signup' do
		!logged_in? ? (erb :'/users/create_user') : (redirect '/characters')
	end

	post '/signup' do
		if !logged_in?
			if params[:username] == "" || params[:password] == "" || params[:email] == ""
				redirect '/signup'
			else
				@user = User.new(username: params[:username], password: params[:password], email: params[:email])
				@user.save
				session[:user_id] = @user_id
				redirect '/characters'
			end
		else
			redirect '/signup'
		end
	end

	get '/login' do
		(!logged_in?) ? (erb :"/users/login") : (redirect "/characters")
	end

	post '/login' do
		binding.pry
		@user = User.find_by(username: params[:username])
		#binding.pry
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect '/characters'
		else
			redirect '/signup'
		end
	end

	get '/logout' do
		if logged_in?
			session.clear
			redirect '/login'
		else
			redirect '/'
		end
	end
end
