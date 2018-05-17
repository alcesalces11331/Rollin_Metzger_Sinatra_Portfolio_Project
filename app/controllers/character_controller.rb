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
end