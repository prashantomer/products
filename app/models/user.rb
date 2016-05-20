class User < ActiveRecord::Base
  after_create :create_role

	has_many :users_roles, dependent: :destroy 
  has_many :roles, through: :users_roles
  has_many :users_answers, dependent: :destroy
  has_many :solutions
  has_many :likes
  has_many :albums, dependent: :destroy

  validates :address, presence: true

  accepts_nested_attributes_for :albums, :allow_destroy => true

  mount_uploader :prof_pic, ProfPicUploader

	# after_create :UsersRole.assign_role(params)
	#before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, #:validatable,
         :omniauthable#, :omniauth_providers => [:facebook], :omniauth_providers => [:twitter]
  
  def before_confirmation
    confirmation_period_expired == false
  end

  def self.from_omniauth(auth)
    # @user ||= User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    # if !@user.persisted?
      where(provider: auth.provider, uid: auth.uid).new do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        
    debugger
        if auth.provider!="twitter"
          user.email = auth.info.email
        else
          user.email= auth.info.nickname+"@gmail.com"
        end
        user.name = auth.info.name
        user.password = Devise.friendly_token[0,20]
      end
      user.skip_confirmation! if auth.provider=="twitter"
      user.save
    # else
    #   sign_in_and_redirect @user, event: :authentication
    #         if is_navigational_format?
    #             set_flash_message(:notice, :success, kind: "Facebook")
    #         end
    # end
  end

  def create_role
    User.last.users_roles.create
  end

  def roles_action(data)  #insctance method	
  	self.users_roles.new(:role_id=>data[:user][:users_roles][:role_id])
  end

  def save_answer(params)
    if params[:answer].nil? == false
      state=(Question.find(params[:question_id]).right_option == params[:answer])
      if self.users_answers.finding(params[:question_id])[0] #find_by_question_id(params[:question_id])
        ans=self.users_answers.finding(params[:question_id])[0] #.find_by_question_id(params[:question_id])
        ans.update(answer: params[:answer], status: state)
        return ans
      else
        self.users_answers.create(question_id: params[:question_id],answer: params[:answer],status: state)
      end
    end
  end

  def save_sol(full_params)
    params=full_params[:solution]
    if params[:solution] != ""
      if (full_params[:commit] == "Reply" || full_params[:commit] == "Post Solution")
        self.solutions.create(question_id: params[:question_id], solution: params[:solution], solution_id: params[:solution_id])
      else
        @sol_update=self.solutions.find(params[:solution_id])
        @sol_update.update(:solution=>params[:solution])
        return @sol_update
      end
    end
  end

  #  def self.roles_action(user,data) #class method
  # 	user.users_roles.new(:role_id=>data[:user][:users_roles][:role_id])
  # end
end
