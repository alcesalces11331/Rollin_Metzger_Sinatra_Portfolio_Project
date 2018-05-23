class RaceController < ApplicationController

	get '/races' do
		if logged_in?
			@races = Race.all
			erb :'/races/index'
		else
			redirect '/login'
		end
	end

	get '/races/new' do
		if logged_in?
			@race 
			erb :'/races/new'
		else
			redirect '/login'
		end
	end

	post '/races' do
		if logged_in?
			if params[:race] == ""
				redirect '/races/new'
			else
				@race = current_user.races.create(params[:race])
				flash[:message] = "Race Created"
				redirect "/races/#{@race.slug}"
			end
		else
			redirect '/login'
		end
	end

	get '/races/:slug' do
		if logged_in?
			@race = Race.find_by_slug(params[:slug])
			erb :'/races/show'
		else
			redirect '/login'
		end
	end

	get '/races/:slug/edit' do 
		if logged_in?
			@race = Race.find_by_slug(params[:slug])
			erb :'/races/edit'
		else
			redirect '/login'
		end
	end

	patch '/races/:slug' do
		if logged_in?
			@race = Races.find_by_slug(params[:slug])
			@race.update(params[:race])
			@race.save
			flash[:message] = "Race Updated"
			redirect "/races/#{@race.slug}"
		else
			redirect '/login'
		end
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
