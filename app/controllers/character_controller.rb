class CharacterController < ApplicationController

	get '/characters' do
		login_validate
		@user = current_user
		@characters = Character.all
		erb :'/characters/characters'
	end

	get '/characters/new' do
		login_validate
		erb :'/characters/new'
	end

	post '/characters' do
		login_validate
		if params[:character] == ""
			redirect "/characters/new"
		else
			@character = current_user.characters.create(params[:character])
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

	post '/characters/:slug' do
		login_validate
		@character = Character.find_by_slug(params[:slug])
		binding.pry
		@character.update(params[:character])
		@character.save
		flash[:message] = "Character Updated"
		redirect "/characters/#{@character.slug}"
	end

	post '/characters/:slug/delete' do
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