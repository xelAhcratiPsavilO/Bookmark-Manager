require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.show_all
    erb :index
  end

  post '/add_link' do
    Link.create(params[:link_url])
    redirect '/'
  end

  run! if app_file == $0

end
