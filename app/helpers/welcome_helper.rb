module WelcomeHelper
	def option_checked(user,qid,answer)
		(user.users_answers.finding(qid)[0] && user.users_answers.finding(qid)[0].answer==answer)
	end
end
