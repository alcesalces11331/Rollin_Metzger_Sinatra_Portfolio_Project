class UserController < ApplicationController

	get '/signup' do
		!logged_in? ? (erb :'/users/create_user') : (redirect '/characters')
	end

	post '/signup' do
		if !logged_in?
			if params[:username] == "" || params[:password] == "" || params[:email] == ""
				redirect '/signup'
			else
				@user = User.create(username: params[:username], password: params[:password], email: params[:email])
				session[:user_id] = @user_id
				redirect '/characters'
			end
		else
			redirect '/signup'
		end
	end
end
