require 'sinatra/flash'

class KlassController < ApplicationController

	get '/klasses' do
		login_validate
		@user = current_user
		@klasses = sift_klasses
		erb :'/klasses/klasses'
	end

	get '/klasses/new' do
		login_validate
		erb :'/klasses/new'
	end

	post '/klasses' do
		login_validate
		@klass = current_user.klasses.create(params[:klass])
		if !@klass.valid?
			flash[:notice] = "Please Fill Out All Forms"
			redirect '/klasses/new'
		else
			flash[:notice] = "Class Created"
			redirect "/klasses/#{@klass.slug}"
		end
	end

	get '/klasses/:slug' do
		login_validate
		@klasses = sift_klasses
		@klass = @klasses.select{|klass| klass.name.downcase == params[:slug].gsub('-', ' ')}.first
		if @klass.user_id == current_user.id
			erb :'/klasses/show'
		else
			flash[:notice] == "You Do Not Have Permission To View This Race"
			redirect '/klasses'
		end
	end

	get '/klasses/:slug/edit' do
		login_validate
		@klasses = sift_klasses
		@klass = @klasses.select{|klass| klass.name.downcase == params[:slug].gsub('-', ' ')}.first
		erb :'/klasses/edit'
	end

	patch '/klasses/:slug' do
		login_validate
		@klasses = sift_klasses
		@klass = @klasses.select{|klass| klass.name.downcase == params[:slug].gsub('-', ' ')}.first
		@klass.update(params[:klass])
		@klass.save
		flash[:notice] = "Class Updated"
		redirect "/klasses/#{@klass.slug}"
	end

	delete '/klasses/:slug/delete' do
		login_validate
		@klasses = sift_klasses
		@klass = @klasses.select{|klass| klass.name.downcase == params[:slug].gsub('-', ' ')}.first
		if logged_in? && @klass.user_id == session[:id]
			@klass.delete
			flash[:notice] = "Class Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end

	def sift_klasses
		Klass.all.select {|klas| klas.user_id == current_user.id || klas.user_id == nil}
	end

end