class BlogPostsController < ApplicationController
	before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  require 'coderay'
  
  def index
  	@blog_posts = BlogPost.all 
  end

  def answerPosts
    @allPosts = BlogPost.all
    @blog_posts = []

    @allPosts.reverse_each do |narrow|
      if narrow.answered == true
        @blog_posts.push(narrow)
      end
    end 

  end

  def unanswerPosts
    @allPosts = BlogPost.all
    @blog_posts = []

    @allPosts.reverse_each do |narrow|
      if narrow.answered == false
        @blog_posts.push(narrow)
      end
    end 

  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def your_posts

  end

  def user_profile
    @user = User.find(params[:id])
    @blog_posts = BlogPost.all
  end

  def new
  	@blog_post = BlogPost.new
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)

  	respond_to do |format|
  		if @blog_post.save
  			format.html {redirect_to @blog_post, notice: "Blog Post was created successfully!"}
  		else
  			format.html {render :edit}
  		end
  	end
  end

  def update
  	respond_to do |format|
  		if @blog_post.update(blog_post_params)
  			format.html {redirect_to @blog_post, notice: "This Blog was successfully updated!"}
  		else
  			format.html {render :edit}
  		end
  	end
  end

  def destroy
  	@blog_post.destroy

  	respond_to do |format|
  		format.html {redirect_to blog_posts_url, notice: "Your blog post was destroyed!"}
  	end	
  end

  private

  def blog_post_params
  	params.require(:blog_post).permit(:title, :entry, :user_id, :category, :codeblock, :codetype)
  end

  def set_blog_post
  	@blog_post = BlogPost.find(params[:id])
  end

end
