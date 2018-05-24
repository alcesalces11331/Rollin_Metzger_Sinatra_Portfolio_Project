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
end