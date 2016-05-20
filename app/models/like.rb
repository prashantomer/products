class Like < ActiveRecord::Base
	belongs_to :solution

	scope :like_find, lambda {|sol,user| where(solution_id: sol,user_id: user) }
end
