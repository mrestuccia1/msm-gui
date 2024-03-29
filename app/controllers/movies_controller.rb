class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def add_entry
    movie = Movie.new(title: params[:title], year: params[:year], duration: params[:duration], description: params[:description], image: params[:image], director_id: params[:director_id])
    movie.save
    redirect_to '/movies'
  end

  def edit_entry
    id = params[:path_id]
    actor = Actor.find(id)
    actor.update(name: params[:name], dob: params[:dob], bio: params[:bio], image: params[:image])
  
    redirect_to "/actors/#{id}"
  end
end
