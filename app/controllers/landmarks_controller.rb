class LandmarksController < ApplicationController
  get '/landmarks' do
    # binding.pry
    @landmarks = Landmark.all
    @figures = Figure.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :"/landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end


  post '/landmarks/:id' do
    @landmark = Landmark.create(params["landmark"])
      unless params[:figure][:name].empty?
        @figure.names << Name.create(params[:name])
      end
      unless params[:title][:name].empty
        @figure.titles << Title.create(params[:title])
      end
      @figure.save

    redirect ("/landmarks/#{@landmark.id}")
  end

  post '/landmarks' do
    Landmark.create(name: params['landmark']['name'], year_completed: params['landmark']['year_completed'])
      redirect ('/landmarks')
    end
end
