class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    if !logged_in?
      erb :index, :layout => :'not_logged_in_layout'
    else
      redirect_to_home_page
    end
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    def redirect_to_question
      redirect to "/question"
    end

    def redirect_to_answer
      redirect to "/answer"
    end
  end
end
