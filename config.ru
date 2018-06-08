#!/usr/bin/env ruby
require './config/environment'

use Rack::MethodOverride
use UserController
use RaceController
use CharacterController
use KlassController
run ApplicationController