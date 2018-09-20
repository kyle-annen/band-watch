APP_ROOT = File.expand_path(__dir__)
$LOAD_PATH.unshift(APP_ROOT) unless $LOAD_PATH.include?(APP_ROOT)

ENV["RACK_ENV"] ||= "development"

require "rubygems"
require "bundler/setup"
require "sinatra"
require "sinatra/reloader" if development?

Dir.glob("app/controllers/**/*.rb").each { |f| require f }

class App < Sinatra::Base
  use IndexController

  run! if app_file == $PROGRAM_NAME
end
