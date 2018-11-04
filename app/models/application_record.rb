class ApplicationRecord < ActiveRecord::Base
	def soft_destroy
		@post.destroy.deleted_at
  	redirect_to root_path
	end

	

  self.abstract_class = true
end
