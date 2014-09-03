Rails.application.routes.draw do
  match('/', {:via => :get, :to => 'lessons#table_of_contents'})
  match('lessons', {:via => :get, :to => 'lessons#table_of_contents'})
  match('lessons/new', {:via => :get, :to => 'lessons#new'})
  match('lessons', {:via => :post, :to => 'lessons#create'})
  match('lessons/:id/edit', {:via => :get, :to => 'lessons#edit'})
  match('lessons/:id', {:via => :patch, :to => 'lessons#update'})
  match('lessons/:id', {:via => :delete, :to => 'lessons#delete'})
end
