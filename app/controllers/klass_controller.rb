class KlassController < ApplicationController

	get '/klasses' do
		if logged_in?
			@klasses = Klass.all
			erb :'/klasses/klasses'
		else
			redirect '/login'
		end
	end

	get '/klasses/new' do
		if logged_in?
			erb :'/klasses/new'
		else
			redirect '/login'
		end
	end

	post '/klasses' do
		if logged_in?
			if params[:klass] == ""
				redirect '/klasses/new'
			else
				@klass = current_user.klasses.create(params[:klass])
				flash[:message] = "Class Created"
				redirect "/klasses/#{@klass.slug}"
			end
		else
			redirect '/login'
		end
	end

	get '/klasses/:slug' do
		if logged_in?
			@klass = Klass.find_by_slug(params[:slug])
			erb :'/klasses/show'
		else
			redirect '/login'
		end
	end
end