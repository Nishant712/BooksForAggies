class BookController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, :with => :record_invalid_rescue1


  def index
    if session.has_key?(:currentName)
      @loginTab=session[:currentName]
    else
      @loginTab='Login/Signup'
    end

    end



  
  def create
    
        
    @title = params[:title]
    @author = params[:author]
    @edition = params[:edition]
    @cid = params[:abstract]
    @isbn = params[:isbn_no]
    @msg = params[:description]
    @user_id=session[:currentUserID]
    @category = params[:category]
    @publisher = params[:publisher]
    @book = Book.create!(:title => @title, :author => @author, :edition => @edition, :abstract => @cid, :isbn_no =>  @isbn, :descriptors => @msg, :user_id => @user_id, :category => @category, :publisher => @publisher)
    if @book.save
      @book_id=@book.id
      session[:return_path]='/book'
      redirect_to "/show/#{@book_id}/show"
    else
      redirect_to '/book'
    end

  end

  def delete
    id = params[:id]
    @book = Book.find(id)
    @book.destroy
    @return = session[:return_path]
    session.delete(:return_path)

    redirect_to '/book'
end

  def edit
    id = params[:id]
    @book = Book.find(id)
    render 'index'

  end

  def update
    id = params[:id]
    @book = Book.find(id)
    @title = params[:title]
    @author = params[:author]
    @edition = params[:edition]
    @cid = params[:abstract]
    @isbn = params[:isbn_no]
    @msg = params[:description]
    @user_id=session[:currentUserID]
    @category = params[:category]
    @publisher = params[:publisher]
    @book.update_attributes!(:title => @title, :author => @author, :edition => @edition, :abstract => @cid, :isbn_no =>  @isbn, :descriptors => @msg, :user_id => @user_id, :category => @category, :publisher => @publisher)
    if @book.save
      @book_id=@book.id
      session[:return_path]='/book'
      redirect_to "/show/#{@book_id}/show"
    else
      redirect_to '/book'
    end
  end

  def signin
    if session.has_key?(:currentName)
      session.delete(:currentName)
      session.delete(:currentUserID)
      redirect_to '/book'
    else
      session[:return_path]='/book'
      redirect_to '/users'
    end
  end

  def signout
    session.delete(:currentUserID)
    session.delete(:currentName)
    redirect_to '/'

  end
end
