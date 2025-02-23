class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) # ここで明示的にPostを取得
    @comment = @post.comments.build(comment_params) # @postに関連付ける

    if @comment.save
      redirect_to post_path(@post)
    else
      @comments = @post.comments.includes(:user)
      @room = user_signed_in? ? Room.find_or_create_by(post_id: @post.id, user_id: current_user.id) : nil
      flash.now[:alert] = 'コメントを入力してください'
      render 'posts/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :comment_image).merge(user_id: current_user.id)
  end
end
