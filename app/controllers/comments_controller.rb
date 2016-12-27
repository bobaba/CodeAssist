class CommentsController < ApplicationController
 before_action :set_comment, only: [:edit, :update, :destroy]
 require 'coderay'
  
  def edit
  end

  def create
  	@comment = Comment.new(comment_params)

  	respond_to do |format|
  		if @comment.save
  			format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was created successfully!"}
  		else
  			format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Your comment failed to post."}
  		end
  	end
  end

  def update
  	respond_to do |format|
  		if @comment.update(comment_params)
  			format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "Comment was updated successfully!"}
  		else
  			format.html {render :edit}
  		end
  	end
  end

  def destroy
  	@comment.destroy
  	respond_to do |format|
  		format.html {redirect_to blog_post_path(id: @comment.blog_post_id), notice: "You comment was removed!"}
  	end
  end

  def solution
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
    currPoints = @user.solPoints

    if @comment.rating == 0
      @comment.update_attributes(rating: 1)
      @user.update_attributes(solPoints: currPoints.to_i + 1)
    elsif @comment.rating == 1
      @comment.update_attributes(rating: 0)
      @user.update_attributes(solPoints: currPoints.to_i - 1)
    end
    
    redirect_to blog_post_path(id: @comment.blog_post_id)
  end


  private

  def comment_params
  	params.require(:comment).permit(:user_id, :entry, :codeblock, :codetype, :rating, :blog_post_id)
  end

  def set_comment
  	@comment = Comment.find(params[:id])
  end


end
