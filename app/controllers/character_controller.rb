class CharacterController < ApplicationController

	get '/characters' do
		binding.pry
		if logged_in?
			@user = current_user
			@characters = Character.all
			erb :'/characters/characters'
		else
			redirect '/login'
		end
	end

	get '/characters/new' do
		if logged_in?
			erb :'/characters/new'
		else
			redirect '/login'
		end
	end

	post '/characters' do
		if logged_in?
			if params[:character] == ""
				redirect "/characters/new"
			else
				@character = current_user.characters.create(params[:character])
				flash[:message] = "Character Created"
				redirect "/characters/#{@character.slug}"
			end
		else
			redirect '/login'
		end
	end

	get '/characters/:slug' do
		if logged_in?
			@character = Character.find_by_slug(params[:slug])
			erb :'/characters/show'
		else
			redirect '/login'
		end
	end

	get '/characters/:slug/edit' do
		if logged_in?
			@character = Character.find_by_slug(params[:slug])
			erb :'/characters/edit'
		else
			redirect '/login'
		end
	end

	patch '/characters/:slug' do
		if logged_in?
			@character = Character.find_by_slug(params[:slug])
			@character.update(params[:character])
			@character.save
			flash[:message] = "Character Updated"
			redirect "/characters/#{@character.slug}"
		else
			redirect '/login'
		end
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