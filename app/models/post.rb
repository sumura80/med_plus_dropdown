class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments
	has_many :likes
	#has_many :likes, dependent: :destroy
	#	論理削除のため、dependent: :destroyをコメント会おうtした
	belongs_to :category

	
	



# 　	def like_user(user)
#    likes.find_by(user_id: user)
#   end
  #ここで定義されているlike_userというメソッドは、
  #そのユーザがアクセスしている投稿にlikeをしているかどうかというものを判定するもの。
  def like_user(user)
		likes.find_by(user_id: user)
  end

end
