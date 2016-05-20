class Solution < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	belongs_to :parent, class_name: 'Solution', :foreign_key => :solution_id
	has_many :children, class_name: 'Solution', dependent: :destroy
	has_many :likes, dependent: :destroy 
end
