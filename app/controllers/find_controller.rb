class FindController < ApplicationController
def index
    if (params.has_key?('search'))


      @books=Book.where('lower(title) LIKE ?', "%#{params[:search].downcase}%")
      @tag=params[:search]

    else
      @books=Book.all
      @tag=''
    end
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end
  end

  def signin
    if session.has_key?(:currentName)
      session.delete(:currentName)
      session.delete(:currentUserID)
      redirect_to '/find'
    else
      session[:return_path]='/find'
      redirect_to '/users'
    end
  end
end
