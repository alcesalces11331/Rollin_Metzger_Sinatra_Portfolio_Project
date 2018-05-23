class RaceController < ApplicationController

	get '/races' do
		@races = Race.all
		erb :'/races/index'
	end

	get '/races/:slug' do
		@race = Race.find_by_slug(params[:slug])
		erb :'/races/show'
	end

	get '/races/new' do
		if logged_in?
			erb :'/races/new'
		else
			redirect '/login'
		end
	end

	post '/races' do
		if logged_in?
			if params[:races] = ""
				redirect '/races/new'
			else
				@race = current_user.races.create(params[:race])
				@race.save
				redirect "/characters/#{@race.slug}"
			end
		else
			redirect '/login'
		end
	end
end
