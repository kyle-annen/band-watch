require "data/sites"
require "httparty"
require "lib/hideout_parser"

class IndexController < Sinatra::Base
  get "/" do
    venues = []

    the_hideout_site = HTTParty.get(Sites::THE_HIDEOUT)
    venues << HideoutParser.new(the_hideout_site).schedule.to_json

    venues.to_json
  end
end
