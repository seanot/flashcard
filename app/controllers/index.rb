# GET ============================================

get '/' do
  @user = User.find_by_email(params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect to "/games"
  else
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
  redirect to('/games')
end
