class PostsController < ApplicationController
		before_action :find_post ,only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all.order("created_at DESC")
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to root_path
  	else
  		render 'edit'
  	end
	end

	def edit
		
	end

	def update
  	if @post.update(post_params)
  		redirect_to post_path
  	else
  		render 'edit'
  	end
	end

	def destroy
		 @post.destroy
  	 redirect_to root_path
	end

	private
  def post_params
  	params.require(:post).permit(:id, :title, :description, :image, :category_id)
  end

  def find_post
  	@post = Post.find(params[:id])
  end
end
