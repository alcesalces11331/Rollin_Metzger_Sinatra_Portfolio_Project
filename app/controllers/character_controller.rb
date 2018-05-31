class CharacterController < ApplicationController

	get '/characters' do
		login_validate
		@user = current_user
		@characters = Character.all
		erb :'/characters/characters'
	end

	get '/characters/new' do
		login_validate
		@klasses = Klass.all
		@races = Race.all
		erb :'/characters/new'
	end

	post '/characters' do
		login_validate
		@character = current_user.characters.create(params[:character])
		if !@character.valid?
			flash[:message] = "Please Fill In All Forms"
			redirect "/characters/new"
		else
			flash[:message] = "Character Created"
			redirect "/characters/#{@character.slug}"
		end
	end

	get '/characters/:slug' do
		login_validate
		@character = Character.find_by_slug(params[:slug])
		erb :'/characters/show'
	end

	get '/characters/:slug/edit' do
		login_validate
		@character = Character.find_by_slug(params[:slug])
		erb :'/characters/edit'
	end

	patch '/characters/:slug' do
		login_validate
		@character = Character.find_by_slug(params[:slug])
		@character.update(params[:character])
		@character.save
		flash[:message] = "Character Updated"
		redirect "/characters/#{@character.slug}"
	end

	delete '/characters/:slug/delete' do
		@character = Character.find_by_slug(params[:slug])
		if logged_in? && @character.user_id == session[:user_id]
			@character.delete
			flash[:message] = "Character Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end
			
end