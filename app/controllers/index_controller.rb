require "lib/hideout_parser"
require "data/sites"
require "httparty"
require "lib/hideout_parser"


class IndexController < Sinatra::Base
  get "/" do
    document = HTTParty.get(Sites.the_hideout)
    HideoutParser.new(document).schedule.to_json
  end

  run! if app_file == $PROGRAM_NAME
end
