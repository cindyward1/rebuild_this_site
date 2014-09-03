Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'lessons#table_of_contents'})
  match('lessons', {:via => :get, :to => 'lessons#table_of_contents'})
  match('lessons/new', {:via => :get, :to => 'lessons#new'})
  match('lessons', {:via => :post, :to => 'lessons#create'})
  match('lessons/:number/show', {:via => :get, :to => 'lessons#show'})
  match('lessons/:number/edit', {:via => :get, :to => 'lessons#edit'})
  match('lessons/:number', {:via => :patch, :to => 'lessons#update'})
  match('lessons/:number', {:via => :delete, :to => 'lessons#destroy'})
end
