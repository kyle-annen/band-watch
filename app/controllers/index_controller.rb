class IndexController < Sinatra::Base
  get "/" do
    "hello world"
  end

  run! if app_file == $PROGRAM_NAME
end
