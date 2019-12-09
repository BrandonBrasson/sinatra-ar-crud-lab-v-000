
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb:new
  end


  post '/articles'  do
  article = Article.new(params[:article])
  article.save
  redirect '/articles'
  end

  get '/articles' do
  @articles = Article.all
  erb :index
  end

get ' /articles/:id' do
  @article = Article.find(params[:id])
  erb :show
  end
  
get ' /articles/:id/edit' do
  @article = Article.find(params[:id])
  erb :edit
  end


  patch '/articles/:id' do
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect  '/@article.id”>articles/{@book.id}'
  end


  delete '/books/:id' do
  @article = Article.find(params[:id])
  @article.destroy
  redirect '/articles'
  end




  delete '/posts/:id/delete' do
      @post = Post.find_by_id(params[:id])
      @post.delete
      erb :deleted #this is the line we are adding
    end


end
