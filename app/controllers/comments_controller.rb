class CommentsController < ApplicationController
	before_action :find_post
	before_action :find_comment ,only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!


	def new
    @comment = Comment.new
  end
  
	def show
		 @comment = Comment.find_by(id: params[:id])
		#showでは@commentしか使わなかったのでほかを削除   
	end

	def create
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to post_path(@post)
		else
			# render post_path(@post)
			 #VIEWしか返さないため、@comments_by_votesを取得しないとエラーになる。
        @comments_by_votes = @post.comments.order_by_voute_count
        render 'posts/show'
		end
	end

	def edit
		
	end

	def update
		if @comment.update(comment_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
		
	end

	def destroy
 		@comment.destroy
 		redirect_to post_path(@post)
 	end



	private

	def comment_params
		params.require(:comment).permit(:content)
	end


	def find_post
		@post = Post.find(params[:post_id])

	end

	def find_comment
		@comment = @post.comments.find(params[:id])
	end


	# これは使っていない
	def check_user 
		unless current_user.admin?
			redirect_to root_path, alert:"Sorry, only Administrator can edit."
		end
	end


end
