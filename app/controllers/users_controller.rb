class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:show, :edit,:update]
	before_action :check_user, only:[:edit]

	def show
		@user = User.find(params[:id])
		@comments = Comment.order("created_at DESC").where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "Your image was successfully updated"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	private
  def user_params
  	params.require(:user).permit(:user_image)
  end

  def check_user
  	@user = User.find(params[:id])
		unless @user == current_user || current_user.admin?
			flash[:alert] = "Sorry, only User can edit"
			redirect_to root_path
		end
	end


end
