get "/login" do
  erb :"sessions/login"
end

post "/login" do
  # first, find the user based on the email from the form
  user = User.find_by(email: params[:email])

  # if we found a user AND the passwords match, THEN store their id in the session
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect root_path
  else
    # otherwise rerender the login form with an error message
    @error = "Sorry, the credentials you provided are incorrect."
    erb :"sessions/login"
  end
end

get "/logout" do
  session.delete(:user_id)

  redirect root_path
end