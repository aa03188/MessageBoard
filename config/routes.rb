Rails.application.routes.draw do
  devise_for :users

  # if "/contact" show the index method of the contacts controller
  get 'contact', to: 'contacts#index'

  # define the method used for contactUs
  post 'contactUs', to: 'contacts#contactUs'

  # pass the messages, contacts and replies as a resource
  resources :messages do
    resources :replies
  end
  
  resources :contacts

  # index page of all messages, if login is succesful.
  root 'messages#all'
end
