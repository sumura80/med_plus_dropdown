class VotesController < ApplicationController
 	def create
		#create.js.erbにpost情報を渡したいためインスタンス変数を利用。
	  vote = Vote.create(user_id: current_user.id, comment_id: params[:comment_id])
    @comment = vote.comment
  end

		

  def destroy

		#create.js.erbにpost情報を渡したいためインスタンス変数を利用。
		vote = current_user.votes.find_by(comment_id: params[:comment_id])
    @comment = vote.comment
    vote.destroy
  end
end
