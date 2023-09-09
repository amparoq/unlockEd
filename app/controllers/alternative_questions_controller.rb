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
    @next_question= @alternative_question.join_user_alternative_questions.first.order_number + 1
  end

  def update_error_counter

    new_error_counter = params[:error_counter].to_i

    task = Task.find(params[:task_id])
    alternative = AlternativeQuestion.find(params[:id])

    if new_error_counter == 0
      task.correct_count = task.correct_count + 1
    end

    alternative.error_counter = new_error_counter

    if params[:wrong_one] == "A"
      alternative.answer_a_show = true
    end
    if params[:wrong_one] == "B"
      alternative.answer_b_show = true
    end
    if params[:wrong_one] == "C"
      alternative.answer_c_show = true
    end

    alternative.save
    
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
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

    respond_to do |format|
      if @alternative_question.save
        format.html { redirect_to alternative_question_url(@alternative_question), notice: "Alternative question was successfully created." }
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
      params.fetch(:alternative_question, {})
    end
end
