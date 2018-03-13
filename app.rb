require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/add_link' do
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec("INSERT INTO links (url) VALUES ('#{params[:link_url]}')")
    redirect '/'
  end

  run! if app_file == $0

end
