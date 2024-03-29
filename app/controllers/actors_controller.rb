class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def add_entry
    actor = Actor.new(name: params[:name], dob: params[:dob], bio: params[:bio], image: params[:image])
    actor.save
    redirect_to '/actors'
  end

  def edit_entry
    id = params[:path_id]
    actor = Actor.find(id)
    actor.update(name: params[:name], dob: params[:dob], bio: params[:bio], image: params[:image])
  
    redirect_to "/actors/#{id}"
  end
end
