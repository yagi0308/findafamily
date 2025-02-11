class PostsController < ApplicationController
  def index
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

  private

  def post_params
    params.require(:post).permit(:animal_image, :title, :category_id, :animal_type, :age, :gender_id, :personality,
                                 :description, :address).merge(user_id: current_user.id)
  end
end
