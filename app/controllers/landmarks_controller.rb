class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end


  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params['landmark']['name']
    @landmark.year_completed = params['landmark']['year_completed']
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end


  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
   redirect "/landmarks"
 end
  # patch '/landmarks/:id' do
  #   @landmark = Landmark.find(params[:id])
  #   @landmark.update(params[:landmark])
  #     unless params[:landmark][:name].empty?
  #       @landmark.name << Landmark.create(params[:landmark][:name])
  #     end
  #     unless params[:landmark][:year_completed].empty?
  #       @landmark.year_completed << Landmark.create(params[:landmark][:year_completed])
  #     end
  #       @landmark.save
  #   redirect "/landmarks/#{@landmark.id}"
  #   end



  end
