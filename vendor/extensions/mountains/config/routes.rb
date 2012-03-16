Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :mountains do
    resources :mountains, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :mountains, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :mountains, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
