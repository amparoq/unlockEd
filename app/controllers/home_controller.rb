class HomeController < ApplicationController

    def index
        @tasks = UserTask.where("user_id = ?", current_user.id).map(&:task)
        @pending_tasks = @tasks.select { |task| task.status == "pending" }

        @completed_or_skipped_tasks = @tasks.select { |task| ["completed", "skipped"].include?(task.status) }

        @colors= ["#ff5757", "#ffd357", "#95ff57", "#84feed", "#6f69fe", "#b969fe"]
      end

    def redirect_to_task
      @task = Task.find(params[:task])
      @complexity = params[:complexity]
      
      if @complexity == "Simple"
        url = task_alternative_question_path(@task, @task.join_user_alternative_questions.first)
      else
        url = task_numerical_question_path(@task, @task.join_user_numerical_questions.first)
      end

      render json: { url: url }
    end
end