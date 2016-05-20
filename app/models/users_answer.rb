class UsersAnswer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	scope :finding, lambda {|que_id| where(question_id: que_id) }

	# def self.save_answer(params)
	# 	debugger
	# 	user.users_answers.create(question_id: params[:question_id],answer: params[:answer])
	# end
end
