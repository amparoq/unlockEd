class HomeController < ApplicationController

    def index
        @pending_tasks = UserTask.where("user_id = ? and status = ? and attempt <= ?", current_user.id, 0, 1).map(&:task)
        @completed_or_skipped_tasks = UserTask.where("user_id = ? and (status = ? or status = ? or attempt = ?)", current_user.id, 1, 2, 2).map(&:task)

        @colors= ["#ff5757", "#ffd357", "#95ff57", "#84feed", "#6f69fe", "#b969fe"]
      end

    def redirect_to_task
      @task = Task.find(params[:task])
      @complexity = params[:complexity]
      
      if @complexity == "Simple"
        first_alt_quest = JoinUserAlternativeQuestion.find_by(task_id: @task.id, order_number: 1)[:alternative_question_id]
        url = task_alternative_question_path(@task, first_alt_quest)
      else
        url = task_numerical_question_path(@task, @task.join_user_numerical_questions.first)
      end

      render json: { url: url }
    end
end