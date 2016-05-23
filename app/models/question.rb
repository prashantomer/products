class Question < ActiveRecord::Base
	has_many :options, dependent: :destroy
	has_many :users_answers, dependent: :destroy
	has_many :solutions, dependent: :destroy
	accepts_nested_attributes_for :options, :allow_destroy => true

	scope :desc,-> { order(:created_at => :desc) }
	scope :pos,-> { order(:position => :asc) }
	# self.per_page = 10
	
end
