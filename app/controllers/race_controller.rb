class RaceController < ApplicationController

	get '/races' do
		login_validate
		@races = Race.all
		erb :'/races/index'
	end

	get '/races/new' do
		login_validate
		@race 
		erb :'/races/new'
	end

	post '/races' do
		login_validate
		if params[:race] == ""
			redirect '/races/new'
		else
			@race = current_user.races.create(params[:race])
			flash[:message] = "Race Created"
			redirect "/races/#{@race.slug}"
		end
	end

	get '/races/:slug' do
		login_validate
		@race = Race.find_by_slug(params[:slug])
		erb :'/races/show'
	end

	get '/races/:slug/edit' do 
		login_validate
		@race = Race.find_by_slug(params[:slug])
		erb :'/races/edit'
	end

	patch '/races/:slug' do
		login_validate
		@race = Races.find_by_slug(params[:slug])
		@race.update(params[:race])
		@race.save
		flash[:message] = "Race Updated"
		redirect "/races/#{@race.slug}"
	end

	delete '/races/:slug/delete' do
		@race = Race.find_by_slug(params[:slug])
		if logged_in? && @race.user_id == session[:user_id]
			@race.delete
			flash[:message] = "Race Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end
end
