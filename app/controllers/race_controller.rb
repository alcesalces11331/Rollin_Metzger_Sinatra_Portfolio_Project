require 'sinatra/flash'

class RaceController < ApplicationController

	get '/races' do
		login_validate
		@user = current_user
		@races = sift_races
		erb :'/races/index'
	end

	get '/races/new' do
		login_validate
		erb :'/races/new'
	end

	post '/races' do
		login_validate
		@race = current_user.races.create(params[:race])
		if !@race.valid?
			flash[:notice] = "Please Fill Out All Forms"
			redirect '/races/new'
		else
			flash[:notice] = "Race Created"
			redirect "/races/#{@race.slug}"
		end
	end

	get '/races/:slug' do
		login_validate
		@races = sift_races
		@race = @races.select{|race| race.name.downcase == params[:slug].gsub('-', ' ')}.first
		if @race.user_id == current_user.id
			erb :'/races/show'
		else
			flash[:notice] == "You Do Not Have Permission To View This Race"
			redirect '/races'
		end
	end

	get '/races/:slug/edit' do 
		login_validate
		@races = sift_races
		@race = @races.select{|race| race.name.downcase == params[:slug].gsub('-', ' ')}.first
		erb :'/races/edit'
	end

	patch '/races/:slug' do
		login_validate
		@races = sift_races
		@race = @races.select{|race| race.name.downcase == params[:slug].gsub('-', ' ')}.first
		@race.update(params[:race])
		@race.save
		flash[:notice] = "Race Updated"
		redirect "/races/#{@race.slug}"
	end

	delete '/races/:slug/delete' do
		login_validate
		@races = sift_races
		@race = @races.select{|race| race.name.downcase == params[:slug].gsub('-', ' ')}.first
		if logged_in? && @race.user_id == session[:user_id]
			@race.delete
			flash[:notice] = "Race Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end

	def sift_races
		Race.all.select {|race| race.user_id == current_user.id || race.user_id == nil}
	end
end
