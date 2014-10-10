Rails.application.routes.draw do

  namespace :api, defaults:{format: :json} do
    namespace :v1 do
      resources :users, only:[] do
        collection do
          get 'add'
        end
      end
      
      resources :items, only:[] do
        collection do 
          get 'add'
          get 'bid'
          get 'finish'
          get 'snapshot'
        end
      end
    end
  end
  
  
  #Mapping required routes to RESTful Routes
  get 'add_user' => 'api/v1/users#add', defaults: {format: :json}
  get 'add_item' => 'api/v1/items#add', defaults: {format: :json}
  get 'bid' => 'api/v1/items#bid', defaults: {format: :json}
  get 'finish' => 'api/v1/items#finish', defaults: {format: :json}
  get 'snapshot' => 'api/v1/items#snapshot', defaults: {format: :json}

end
