class NumericalQuestionsController < ApplicationController
  before_action :set_numerical_question, only: %i[ show edit update destroy ]

  VOLUMENES_AGUA_SATURADA = { 80=>0.001029, 81=>0.0010297,82=>0.00103,
83=>0.001031,84=>0.00103173,85=>0.00103242,86=>0.00103311,87=>0.00103381,
88=>0.00103451,89=>0.00103522,90=>0.00103594,91=>0.00103667,92=>0.0010374,
93=>0.00103813,94=>0.00103887,95=>0.00103962,96=>0.00104038,97=>0.00104114,
98=>0.0010419,99=>0.00104268,100=>0.00104346}
  # GET /numerical_questions or /numerical_questions.json
  def index
    @numerical_questions = NumericalQuestion.all
  end

  # GET /numerical_questions/1 or /numerical_questions/1.json
  def show
    @task= Task.find(@numerical_question.join_user_numerical_questions.first.task_id)
    if !UserQuestionValue.find_by(user_id: current_user.id, numerical_question_id: @numerical_question.id).present?
      information_question = NumericalQuestion.generate_question(@numerical_question.question)
      @enunciado = information_question["pregunta"]
      information_question.each do |key, value|
        if key != "pregunta"
          entry = UserQuestionValue.create(user_id: current_user.id, numerical_question_id: @numerical_question.id, value_name: key, value: value, statement: @enunciado)
          if key == "temperatura_C_vap"
            @volumen_agua_saturada = VOLUMENES_AGUA_SATURADA[value]
          end
        end
      end
    else
      valor_temp = UserQuestionValue.find_by(value_name: "temperatura_C_vap", user_id: current_user.id)[:value].to_i
      @volumen_agua_saturada = VOLUMENES_AGUA_SATURADA[valor_temp]
      @enunciado = UserQuestionValue.find_by(user_id: current_user.id, numerical_question_id: @numerical_question.id).statement
    end
    if @numerical_question.id == 1
      @respuesta = @volumen_agua_saturada*UserQuestionValue.find_by(value_name: "masa_kg", user_id: current_user.id)[:value]
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
