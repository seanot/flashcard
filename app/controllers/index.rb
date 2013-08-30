# GET ============================================

get '/' do
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/games'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :index
  end
end

get '/register' do
  erb :register
end


  

# POST ===========================================

post '/register' do
  @user = User.create(email: params[:email],
                      password: params[:password])
  
  session[:user_id] = @user.id
  redirect to('/games')
end
