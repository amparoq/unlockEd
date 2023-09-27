class AlternativeQuestionsController < ApplicationController
  before_action :set_alternative_question, only: %i[ show edit update destroy ]

  # GET /alternative_questions or /alternative_questions.json
  def index
    @alternative_questions = AlternativeQuestion.all
  end

  # GET /alternative_questions/1 or /alternative_questions/1.json
  def show
    @task= Task.find(params[:task_id])
    @total_questions = @task.join_user_alternative_questions.count
    @actual = JoinUserAlternativeQuestion.find_by(alternative_question_id: @alternative_question.id, task_id: @task.id)[:order_number]
    if @actual != 3
      @next_question = JoinUserAlternativeQuestion.find_by(task_id: @task.id, order_number: @actual + 1)[:alternative_question_id]
    else
      @next_question = 1
    end
    error_counter_table = ErrorCountAlternative.find_by(alternative_question_id: @alternative_question.id, user_id: current_user.id, task_id: @task.id)
    @error_counter = error_counter_table.error_count
    @answer_a_show = error_counter_table.answer_a_show
    @answer_b_show = error_counter_table.answer_b_show
    @answer_c_show = error_counter_table.answer_c_show
    update_attempt(@task.id)
    @attempt = UserTask.find_by(user_id: current_user.id, task_id: @task.id)[:attempt]
  end

  def update_attempt(task_id)
    @alternatives_error_counts = ErrorCountAlternative.where(task_id: task_id)
    second_attempt = true
    not_attempted = false
    @alternatives_error_counts.each do |altec|
      if altec.error_count == 1
        second_attempt = false
      end
      if altec.error_count == -1
        not_attempted = true
      end
    end
    @user_task = UserTask.find_by(user_id: current_user.id, task_id: @task.id)
    if !not_attempted
      if second_attempt
        @user_task.attempt = 2
        @user_task.save
      else
        @user_task.attempt = 1
        @user_task.save
      end
    end
    if @user_task.attempt == 2
      @user_task.status = 2
      @user_task.save
      @alts = ErrorCountAlternative.where(user_id: current_user.id, task_id: @task.id)
      @alts.each do |a|
        if a.error_count == 0
          valid_alt = ValidAlternativeQuestion.find_by(user_id: current_user.id, alternative_question_id: a.alternative_question_id)
          valid_alt.usable = false
          valid_alt.save
        end
      end
    end
  end

  def update_error_counter
    new_error_counter = params[:error_counter].to_i

    @task= Task.find(params[:task_id])

    alternative = AlternativeQuestion.find(params[:id])
    error_counter_table = ErrorCountAlternative.find_by(alternative_question_id: alternative.id, user_id: current_user.id, task_id: @task.id)

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
    @users_s = User.student

    respond_to do |format|
      if @alternative_question.save
        @users_s.each do |valid|
          ValidAlternativeQuestion.create(user_id: valid.id, alternative_question_id: @alternative_question.id)
        end
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
