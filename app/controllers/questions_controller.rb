class QuestionsController < ApplicationController

  skip_before_filter :verify_authenticity_token #to allow params for position without filtration

  def index
    @questions=Question.all.pos.paginate(:page => params[:page], :per_page => 11)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  	@question = Question.new
  	2.times {@question.options.build}
  end

  def create
  	question=Question.new(question_params)
  	if question.save
			redirect_to questions_path
    else
      redirect_to new_question_option_path
		end
  end

  def edit
    @question=Question.find(params[:id])
  end

  def update
    question=Question.update(params[:id],question_params)
    question.users_answers.destroy_all
    redirect_to questions_path, :notice=> 'Question Updated'
  end

  def show
  end

  def position
    debugger
    row = params[:row]
    row.each do |id|
      Question.find(id.last.to_i).update(position: id.first.to_i)
    end
    redirect_to :back
  end

  private
  def question_params
  	params.require(:question).permit(:question, :right_option, options_attributes: [:id,:option,:_destroy])
  end

end
