class AlternativeQuestionsController < ApplicationController
  before_action :set_alternative_question, only: %i[ show edit update destroy ]

  # GET /alternative_questions or /alternative_questions.json
  def index
    @alternative_questions = AlternativeQuestion.all
  end

  # GET /alternative_questions/1 or /alternative_questions/1.json
  def show
    @task= Task.find(@alternative_question.join_user_alternative_questions.first.task_id)
    @total_questions = @task.join_user_alternative_questions.count
    @next_question = @alternative_question.join_user_alternative_questions.first.id + 1
    error_counter_table = ErrorCountAlternative.find_by(alternative_question_id: @alternative_question.id, user_id: current_user.id)
    @error_counter = error_counter_table.error_count
    @answer_a_show = error_counter_table.answer_a_show
    @answer_b_show = error_counter_table.answer_b_show
    @answer_c_show = error_counter_table.answer_c_show
    @attempt = UserTask.find_by(user_id: current_user.id, task_id: @task.id)[:attempt]

  end

  def update_attempt 
    @alternative_question = AlternativeQuestion.find(params[:id])
    @task= Task.find(@alternative_question.join_user_alternative_questions.first.task_id)
    @user_task = UserTask.find_by(user_id: current_user.id, task_id: @task.id)
    @user_task.attempt = @user_task.attempt + 1
    @user_task.save
  end

  def update_error_counter

    new_error_counter = params[:error_counter].to_i

    alternative = AlternativeQuestion.find(params[:id])
    error_counter_table = ErrorCountAlternative.find_by(alternative_question_id: alternative.id, user_id: current_user.id)

    # if new_error_counter == 0
    #   task.correct_count = task.correct_count + 1
    # end

    error_counter_table.error_count = new_error_counter

    if params[:wrong_one] == "A"
      error_counter_table.answer_a_show = true
    end
    if params[:wrong_one] == "B"
      error_counter_table.answer_b_show = true
    end
    if params[:wrong_one] == "C"
      error_counter_table.answer_c_show = true
    end

    error_counter_table.save
    
  end

  # GET /alternative_questions/new
  def new
    @alternative_question = AlternativeQuestion.new
  end

  # GET /alternative_questions/1/edit
  def edit
  end

  # POST /alternative_questions or /alternative_questions.json
  def create
    @alternative_question = AlternativeQuestion.new(alternative_question_params)
    @alternative_question.difficulty = alternative_question_params[:difficulty].to_i

    respond_to do |format|
      if @alternative_question.save
        format.html { redirect_to root_path, notice: "Alternative question was successfully created." }
        format.json { render :show, status: :created, location: @alternative_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alternative_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alternative_questions/1 or /alternative_questions/1.json
  def update
    respond_to do |format|
      if @alternative_question.update(alternative_question_params)
        format.html { redirect_to alternative_question_url(@alternative_question), notice: "Alternative question was successfully updated." }
        format.json { render :show, status: :ok, location: @alternative_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alternative_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternative_questions/1 or /alternative_questions/1.json
  def destroy
    @alternative_question.destroy

    respond_to do |format|
      format.html { redirect_to alternative_questions_url, notice: "Alternative question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternative_question
      @alternative_question = AlternativeQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alternative_question_params
      params.fetch(:alternative_question, {}).permit(:module, :difficulty, :question, :alternative_a, :alternative_a_answer, :alternative_b, :alternative_b_answer, :alternative_c, :alternative_c_answer, :correct_alternative)
    end
end
