class RaceController < ApplicationController

	get '/races' do
		login_validate
		@user = current_user
		@races = Race.select {|race| race.user_id == @user.id || race.user_id == nil}
		erb :'/races/index'
	end

	get '/races/new' do
		login_validate
		@race 
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
		@race = Race.find_by_slug(params[:slug])
		@race.update(params[:race])
		@race.save
		flash[:notice] = "Race Updated"
		redirect "/races/#{@race.slug}"
	end

	delete '/races/:slug/delete' do
		@race = Race.find_by_slug(params[:slug])
		if logged_in? && @race.user_id == session[:user_id]
			@race.delete
			flash[:notice] = "Race Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end
end
