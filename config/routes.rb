Rails.application.routes.draw do
  get 'main' => 'home#main'
  post 'main/create'  => 'home#create'
  post 'main/finish'  => 'home#finish'

end
