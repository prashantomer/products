class Album < ActiveRecord::Base
	belongs_to :user
	mount_uploader :picture, ProfPicUploader
end
