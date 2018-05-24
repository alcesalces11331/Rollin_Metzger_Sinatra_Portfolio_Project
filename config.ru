#!/usr/bin/env ruby
require './config/environment'

#if ActiveRecord::Migrator.needs_migration?
	#raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
#end

use UserController
use RaceController
use CharacterController
use KlassController
use Rack::MethodOverride
run ApplicationController