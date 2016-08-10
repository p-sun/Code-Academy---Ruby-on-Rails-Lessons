Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'tags' => 'tags#index'
  get 'tags/:id' => 'tags#show', as: :tag
    # Use /:id to name the string after the '/' in the url :id
    #   i.e. the request is sent to the 'tags#show' action with {id: 1} in params
    #   Then in the controller, use the /:id to find a specific Tag
    # Use as: to name the route 'tags/:id' as :tag.
    #   This allows for rails to generate the method tag_path,
    #   which is used in tags/index.erb to generate a url such as 'tags/3', for :id = 3
  get 'destinations/:id' => 'destinations#show', as: :destination
  get 'destinations/:id/edit' => 'destinations#edit', as: :edit_destination
  patch 'destinations/:id' => 'destinations#update'

end
