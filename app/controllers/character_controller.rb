class CharacterController < ApplicationController

	get '/characters' do
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
				@character.save
				redirect "/characters/#{@character.id}"
			end
		else
			redirect '/login'
		end
	end

	get '/characters/:id' do
		if logged_in?
			@character = Character.find_by_id(params[:id])
			erb :'/characters/show'
		else
			redirect '/login'
		end
	end
end