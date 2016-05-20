class WelcomeController < ApplicationController
	before_action :authenticate_user!
  # include WelcomeHelper

  def welcome
  end
  def question_paper
    @que_papers = Question.paginate(:page => params[:page], :per_page => 1)
  end

  def evaluation
    @ans = current_user.save_answer(params)        
    if @ans
      redirect_to :back, :notice=> 'Answer Submitted...'    
    else
      redirect_to :back, :notice=> 'Please Choose Any Option...'
    end
  end

  def take_test
  end

  def sol_edit
    @sol=Solution.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update_sol
    @sol_update=current_user.save_sol(params)
    respond_to do |format|
      format.js 
      format.html
    end
  end

  def solution_reply    
    @sol=current_user.save_sol(params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def save_like
    if !current_user.likes.find_by_solution_id(params[:id])
      @like = current_user.likes.create(solution_id: params[:id])
    else
      @like=current_user.likes.find_by_solution_id(params[:id]).destroy
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def save_reply
    @sol_reply=current_user.save_sol(params)    
    respond_to do |format|
      format.html
      format.json
    end
  end

  def dashboard  	
  end

  def destroy
    @sol=current_user.solutions.find(params[:id]).destroy
    respond_to do |format|
      format.js
      format.html
    end
  end

end
