class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

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
    if @post.save
      flash[:notice] = "投稿しました"
    redirect_to(posts_path)
    else
      render(new_post_path)
    end
  end



  def edit
  end
  
  def update
    # @post.assign_attributes(params[:post])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "変更を保存しました"
      redirect_to(posts_path)
    else
      render(edit_post_path)
    end
  end



  def destroy
    @post.destroy
    flash[:notice] = "投稿を削除しました"
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