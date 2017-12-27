class HomeController < ApplicationController
def index
	if session.has_key?(:return_path)
		session.delete(:return_path)
	end
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end
  end

  def logout
    session.delete(:currentName)
    session.delete(:currentUserID)
    if(session.has_key?(:return_path))
    redirect_to session[:return_path]
    else
    redirect_to root_path
    end
  end

  def book
    if session.has_key?(:currentName)
      redirect_to '/book'
    else
      session[:return_path]='/book'
      redirect_to '/users'
    end
  end
end
