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
		if params[:klass] == ""
			redirect '/klasses/new'
		else
			@klass = current_user.klasses.create(params[:klass])
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
end