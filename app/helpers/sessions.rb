helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def login_required!
    redirect login_path unless current_user
  end
end