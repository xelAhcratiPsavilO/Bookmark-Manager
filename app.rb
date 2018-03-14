require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.show_all
    erb :index
  end

  post '/add_link' do
    flash[:notice] = "You must submit a valid URL." unless Link.create(params[:url])
    redirect('/')
  end

  run! if app_file == $0

end
