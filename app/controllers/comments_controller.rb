class CommentsController < ApplicationController
  def index
    
  end
  
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment    
    else
      render json: comment.errors.full_messages, status: 422
    end
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render plain: "Destroyed comment by #{User.find(comment.user_id)}. Body: #{comment.body}"
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
  
end