class KlassController < ApplicationController

	get '/klasses' do
		login_validate
		@klasses = Klass.all
		erb :'/klasses/klasses'
	end

	get '/klasses/new' do
		login_validate
		erb :'/klasses/new'
	end

	post '/klasses' do
		login_validate
		binding.pry
		@klass = current_user.klasses.create(params[:klass])
		if !@klass.valid?
			flash[:message] = "Please Fill Out All Forms"
			redirect '/klasses/new'
		else
			flash[:message] = "Class Created"
			redirect "/klasses/#{@klass.slug}"
		end
	end

	get '/klasses/:slug' do
		login_validate
		@klass = Klass.find_by_slug(params[:slug])
		erb :'/klasses/show'
	end

	get '/klasses/:slug/edit' do
		login_validate
		@klass = Klass.find_by_slug(params[:slug])
		@klasses = Klass.all
		erb :'/klasses/edit'
	end

	patch '/klasses/:slug' do
		login_validate
		@klass = Klass.find_by_slug(params[:slug])
		@klass.update(params[:klass])
		@klass.save
		flash[:message] = "Class Updated"
		redirect "/klasses/#{@klass.slug}"
	end

	delete '/klasses/:slug/delete' do
		@klass = Klass.find_by_slug(params[:slug])
		if logged_in? && @klass.user_id == session[:id]
			@klass.delete
			flash[:message] = "Class Deleted"
			redirect '/'
		else
			redirect '/login'
		end
	end

end