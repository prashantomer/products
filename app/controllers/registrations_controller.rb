class RegistrationsController < Devise::RegistrationsController

	before_filter :configure_permitted_parameters, if: :devise_controller?

	def create	
	  @user = User.new(sign_up_params)
	  # @user_role=User.roles_action(@user, params) #class method
	  @user_role=@user.roles_action(params) #instance method
		if @user_role.save
			#UserMailer.welcome_email(@user).deliver
			redirect_to(root_path, :notice => 'User was successfully created.')
   #    format.xml  { render :xml => @user, :status => :created, :location => @user }
	  	# if resource.active_for_authentication?
	   #    sign_up(resource_name, resource)
	   #    respond_with resource, location: after_sign_up_path_for(resource)
	   #  end
	  else
 
      redirect_to :back, :notice=>"Please Fill All Fields..."
		end		
	end

	protected

	def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :users_roles_attributes=>[:role_id])}
	end

	def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

	def after_sign_up_path_for(resource)
    root_path # Or :prefix_to_your_route
  end

end


# c = User.find(me)
# @sheets = c.time_sheets