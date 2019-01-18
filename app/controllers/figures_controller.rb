class FiguresController < ApplicationController

  #index
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  #new figures
  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(name: params[:name])
    redirect to '/figures/#{@figure.id}'
  end

  #show figures by id
  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  #edit figures by id
  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure = Figure.update(name: params[:name])
    redirect to '/figures/#{@figure.id}'
  end
end
