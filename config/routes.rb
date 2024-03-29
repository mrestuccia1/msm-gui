Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })

  post("/directors", { :controller => "directors", :action => "add_entry" })
  post("/directors/:path_id", { :controller => "directors", :action => "edit_entry" })

  post("/movies", { :controller => "movies", :action => "add_entry" })
  post("/movies/:path_id", { :controller => "movies", :action => "edit_entry" })
  
  post("/actors", { :controller => "actors", :action => "add_entry" })
  post("/actors/:path_id", { :controller => "actors", :action => "edit_entry" })
  
end
