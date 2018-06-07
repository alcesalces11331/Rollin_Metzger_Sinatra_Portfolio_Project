require 'sinatra/flash'

class CharacterController < ApplicationController

	get '/characters' do
		login_validate
		@user = current_user
		@characters = sift_characters
		erb :'/characters/characters'
	end

	get '/characters/new' do
		login_validate
		@klasses = Klass.all.select {|klas| klas.user_id == current_user.id || klas.user_id == nil}
		@races = Race.all.select {|race| race.user_id == current_user.id || race.user_id == nil}
		erb :'/characters/new'
	end

	post '/characters' do
		login_validate
		@klass = Klass.find_by(name: params[:character]["klass"].keys.first).id
		@race = Race.find_by(name: params[:character]["race"].keys.first).id
		@character = current_user.characters.create(params[:character])
		@character.klass = @klass
		@character.race = @race
		@character.save
		if !@character.valid?
			flash[:notice] = "Please Fill In All Forms"
			redirect "/characters/new"
		else
			flash[:notice] = "Character Created"
			redirect "/characters/#{@character.slug}"
		end
	end

	get '/characters/:slug' do
		login_validate
		@characters = sift_characters
		@character = @characters.select{|char| char.name.downcase == params[:slug].gsub('-', ' ')}.first
		@race = Race.find_by_id(@character.race.to_i)
		@klass = Klass.find_by_id(@character.klass.to_i)
		if @character.user_id == current_user.id
			erb :'/characters/show'
		else
			flash[:notice] = "You Do Not Have Permission to View This Character"
			redirect "/characters"
		end
	end

	get '/characters/:slug/edit' do
		login_validate
		@characters = sift_characters
		@character = @characters.select{|char| char.name.downcase == params[:slug].gsub('-', ' ')}.first
		@race = Race.find_by_id(@character.race.to_i)
		@klass = Klass.find_by_id(@character.klass.to_i)
		erb :'/characters/edit'
	end

	patch '/characters/:slug' do
		login_validate
		@character = Character.find_by_slug(params[:slug])
		@character.update(params[:character])
		@character.save
		flash[:notice] = "Character Updated"
		redirect "/characters/#{@character.slug}"
	end

	delete '/characters/:slug/delete' do
		login_validate
		@characters = sift_characters
		@character = @characters.select{|char| char.name.downcase == params[:slug].gsub('-', ' ')}.first
		if logged_in? && @character.user_id == session[:user_id]
			@character.delete
			flash[:notice] = "Character Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end

	def sift_characters
		Character.all.select {|char| char.user_id == current_user.id || char.user_id == nil}
	end
			
end