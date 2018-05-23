class RaceController < ApplicationController

	get '/races' do
		if logged_in?
			@races = Race.all
			erb :'/races/index'
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
				flash[:message] = "Race Created"
				redirect "/characters/#{@race.slug}"
			end
		else
			redirect '/login'
		end
	end

	patch '/races/:slug' do
		if logged_in?
			@race = Character.find_by_slug(params[:slug])
			@race.update(params[:race])
			@race.save
			flash[:message] = "Race Updated"
			redirect "/races/#{@race.slug}"
		else
			redirect '/login'
		end
	end
end
