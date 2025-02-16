class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :update_adoption, :favorite]

  def index
    @q = Post.ransack(params[:q])
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_adoption
    @post = Post.find(params[:id])
    @post.update(adoption: true)
    redirect_to @post, notice: '家族が見つかりました！'
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  def search
    @q = Post.ransack(params[:q])
    @search_results = @q.result(distinct: true) if params[:q].present?
    @posts = Post.all
    render :index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:animal_image, :title, :category_id, :animal_type, :age, :gender_id, :personality,
                                 :description, :address).merge(user_id: current_user.id)
  end
end
