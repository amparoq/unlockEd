class AlternativeQuestionsController < ApplicationController
  before_action :set_alternative_question, only: %i[ show edit update destroy ]

  # GET /alternative_questions or /alternative_questions.json
  def index
    @alternative_questions = AlternativeQuestion.all
  end

  # GET /alternative_questions/1 or /alternative_questions/1.json
  def show
    @task= Task.find(@alternative_question.join_user_alternative_questions.first.task_id)
    @total_questions = @task.join_user_alternative_questions.count + 1
    @next_question= @alternative_question.join_user_alternative_questions.first.order_number + 1
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
