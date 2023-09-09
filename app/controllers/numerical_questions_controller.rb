class NumericalQuestionsController < ApplicationController
  before_action :set_numerical_question, only: %i[ show edit update destroy ]

  # GET /numerical_questions or /numerical_questions.json
  def index
    @numerical_questions = NumericalQuestion.all
  end

  # GET /numerical_questions/1 or /numerical_questions/1.json
  def show
    if !UserQuestionValue.find_by(user_id: current_user.id, numerical_question_id: @numerical_question.id).present?
      information_question = NumericalQuestion.generate_question(@numerical_question.question)
      @enunciado = information_question["pregunta"]
      information_question.each do |key, value|
        if key != "pregunta"
          entry = UserQuestionValue.create(user_id: current_user.id, numerical_question_id: @numerical_question.id, value_name: key, value: value, statement: @enunciado)
        end
      end
    else
      @enunciado = UserQuestionValue.find_by(user_id: current_user.id, numerical_question_id: @numerical_question.id).statement
    end
  end
  

  # GET /numerical_questions/new
  def new
    @numerical_question = NumericalQuestion.new
  end

  # GET /numerical_questions/1/edit
  def edit
  end

  # POST /numerical_questions or /numerical_questions.json
  def create
    @numerical_question = NumericalQuestion.new(numerical_question_params)

    respond_to do |format|
      if @numerical_question.save
        format.html { redirect_to numerical_question_url(@numerical_question), notice: "Numerical question was successfully created." }
        format.json { render :show, status: :created, location: @numerical_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @numerical_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /numerical_questions/1 or /numerical_questions/1.json
  def update
    respond_to do |format|
      if @numerical_question.update(numerical_question_params)
        format.html { redirect_to numerical_question_url(@numerical_question), notice: "Numerical question was successfully updated." }
        format.json { render :show, status: :ok, location: @numerical_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @numerical_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numerical_questions/1 or /numerical_questions/1.json
  def destroy
    @numerical_question.destroy

    respond_to do |format|
      format.html { redirect_to numerical_questions_url, notice: "Numerical question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_numerical_question
      @numerical_question = NumericalQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def numerical_question_params
      params.fetch(:numerical_question, {})
    end
end
