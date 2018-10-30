Rails.application.routes.draw do
  get '/contact', to: 'home#contact'
  post '/contact', to: 'home#contact_success'
  get '/team', to: 'home#team'
  get '/', to: 'home#home'
  get '/welcome/:first_name', to: 'welcome#hello'
  get '/welcome/', to: 'welcome#welcome'
  get '/gossips/', to: 'gossips#list_gossips'
  get '/gossips/:id', to: 'gossips#single_gossip'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
