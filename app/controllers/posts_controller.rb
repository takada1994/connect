class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # def index
  #   @posts = Post.all
  # end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to(posts_path)
  end


  def edit
  end

  def update
    @post.content = params[:content]
    if @post.save
      redirect_to(posts_path)
    else
      redirect_to(edit_post_path)
    end
  end


  def destroy
    @post.destroy
    redirect_to(posts_path)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end

end

  
  # def update
  #   @post.content = params[:content]
  #   if @post.save
  #     flash[:notice] = "投稿を編集しました"
  #     redirect_to("/posts/index")
  #   end
  # end

  # def update
  #   if @post.save
  #     redirect_to("/posts/index")
  #   else
  #     redirect_to("/posts/#{@post.id}/edit")
  #   end
  # end
