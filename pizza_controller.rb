require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/pizza.rb')

#index - read (THIS IS ROUTE 1!)
get '/pizzas' do  #convention is to use a plural
  @pizzas = Pizza.all()
  erb(:index)     #displays stuff to the user / calls the index view
end

#new - create (THIS IS ROUTE 3!)
get '/pizzas/new' do
  erb(:new)
end

#show - read (THIS IS ROUTE 2!)
get '/pizzas/:id' do #be careful! Catches everything else.
  @pizza = Pizza.find( params[:id] )
  erb(:show)
end

#create - create (THIS IS ROUTE 4!)
post '/pizzas' do
  #the params are magically taken in from the form!
  @pizza = Pizza.new(params) #as long as the form's field names match up with the names in initialize!
  @pizza.save
  erb(:create)
end

# (THIS IS ROUTE 5!)
get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id] )
  erb(:edit)
end

# (THIS IS ROUTE 6!)
post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update
  erb(:update)
end

# (THIS IS ROUTE 7!)
post '/pizzas/:id/delete' do
  @pizza_to_delete = Pizza.find( params[:id] )
  @pizza_to_delete.delete

  redirect to '/pizzas'
  # @pizzas = Pizza.all()
  # erb(:index) 
end




