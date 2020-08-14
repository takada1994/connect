class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end
  
  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def edit
  @post = Post.find_by(id: params[:id])
  end

  def update
    redirect_to("/post/index")
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end
