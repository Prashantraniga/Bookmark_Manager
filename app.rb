require 'sinatra/base'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/choice' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
