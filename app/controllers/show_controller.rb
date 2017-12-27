class ShowController < ApplicationController
def index
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end
    id = params[:id]
    @book = Book.find(id)
    @user = User.find(@book.user_id)
  end

  def books
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end
    @books = Book.where(:user_id => session[:currentUserID])
    render 'books'
  end

  def requesting
    @book_id=params[:book_id]
    @user_id=params[:user_id]
    @user2_id=params[:user2_id]
    @msg=params[:msg]
    @request=Request.create!(:user_id=>@user_id,:book_id=>@book_id,:des=>@msg,:user2_id=>@user2_id)
    if(@request.save)
      redirect_to '/find'
    end
  end

  def notifications
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end
    @requesting=Request.where(:user2_id => session[:currentUserID])
    @request=[]
    @requesting.each do |req|
      @user2=User.find(req.user_id)
      @book = Book.find(req.book_id)
      @request.push({:id=>req.id,:user2=>@user2.name,:book=>@book.title,:msg=>req.des,:contact=>@user2.email})

    end

    render 'notification'
  end


  def about
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end
    render 'about'
  end
end
