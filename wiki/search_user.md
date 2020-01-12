# Implementing User-Search feature
  
  As inspired from Instagram, it provides a user searching feature basis of their username. Here's something that resonates the feature implemented on rails.

## Steps Followed:

### Creating a controller to return the results from search
  > search_contoller.rb

    def create
      if params[:search].blank?   
        flash[:alert] = 'No Search Keywords!'
        redirect_to root_path
      else
        @parameter = '%' + params[:search].downcase + '%'
        @results =
        Profile.where('lower(username) like :search', search: @parameter)
        render :create
      end
    end

  __If no search-keyword is submitted it raises an alert.__ 
  _@results_ __here, hits a query which search profile tables where it's username attributes is same as keyword sent from the search form__

### Creating a route to the search page
  
  > routes.rb

    get '/search' => 'search#create', :as => 'search_page'

  *'/search'* is the route to the search page and search#create directs to the views *'search/creates'*

### Creating A from in Views

The search bar here is in Navbar  (_navbar.html.erb). 

    <div class="col-sm-3">
        <%= form_with(url: search_user_path, :method => 'get', class: "form-inline my2 my-lg-0", local: true ) do %>
          <%= search_field_tag :search, params[:search], placeholder: "@search", class: "form-control", remote: false %>  
        <%end%>
      </div> 

This form is a form helper provided by Rails through Rails Action View.
Here, What I found is, *form_with* creates a request with __data-remote = true__ which is a __XMLHttpRequest__.
This created a problem that the search page was rendered by server. The response is fetched by browser but counldn't render on the page.

Found that Solution is to set __data-remote=false__ to the __form_with__, which could be done __*not by remote : false*__ but __locals: true__.


