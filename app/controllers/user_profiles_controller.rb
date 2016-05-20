class UserProfilesController < ApplicationController

	def show
		@user=User.find(params[:id])
		respond_to do |format|
			format.js
			format.html
		end
	end

	def edit
		@user=User.find(current_user)
	end

	def update
		@user=User.find(current_user) 
		debugger
		if @user.update(update_params)
			@user.update(prof_pic: params[:file_0])
			#before_save :album_save
			i=0
			until i>(params.values.count-9) do
				@user.albums.create(picture: params.values[i])
				i+=1
			end 
			respond_to do |format|
				format.json { render json: {"message": true} }
				format.html
			end
		else
				respond_to do |format|
				format.json { render json: @user.errors }
				format.html
			end
		end	
	end

	# def album_save(pics)
	# 	pics.each
	# end

	private
	def update_params
		params.require(:user).permit(:address, :contact)
		# params.require(:file_0)
	end
end

