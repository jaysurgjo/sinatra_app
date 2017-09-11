class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    if !logged_in?
      erb :index, :layout => :'not_logged_in_layout' #=> Log In Page
    else
      redirect_to_home_page
    end
  end
end
