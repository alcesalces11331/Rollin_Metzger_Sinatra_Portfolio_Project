class RaceController < ApplicationController

	get '/races' do
		@races = Race.all
		erb :'/races/index'
	end

	get '/races/:slug' do
		@race = Race.find_by_slug(params[:slug])
		erb :'/races/show'
	end
end
