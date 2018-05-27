require 'pry'
class UserController < ApplicationController

	get '/signup' do
		!logged_in? ? (erb :'/users/create_user') : (redirect '/characters')
	end

	post '/signup' do
		@user = User.create(username: params[:username], password: params[:password], email: params[:email])
		if !@user.valid?
			@user.clear
			redirect '/signup'
		else
			session[:user_id] = @user_id
			redirect '/login'
		end
	end

	get '/login' do
		redirect to '/characters' if logged_in?
		erb :'/users/login'
	end

	post '/login' do
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect '/characters'
		else
			redirect '/signup'
		end
	end

	get '/logout' do
		login_validate
		session.clear
		redirect '/login'
	end
end
