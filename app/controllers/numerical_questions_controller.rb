class NumericalQuestionsController < ApplicationController
  before_action :set_numerical_question, only: %i[ show edit update destroy ]


  # GET /numerical_questions or /numerical_questions.json
  def index
    @numerical_questions = NumericalQuestion.all
  end

  # GET /numerical_questions/1 or /numerical_questions/1.json
  def show
    xlsx_vc = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'tablaVC_mine.xlsx'))
    xlsx_vc.default_sheet = xlsx_vc.sheets[1]

    xlsx_prop_agua_sat = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'Propiedades_Agua_saturada.xlsx'))
    entalpia_con_temp = {}
    headers_agua = xlsx_prop_agua_sat.row(1)

    xlsx_134 = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'H134A_tsat.xlsx'))
    headers_134 = xlsx_134.row(1)
    @data_134 = []
    2.upto(xlsx_134.last_row) do |row_num|
      row = Hash[headers_134.zip(xlsx_134.row(row_num))]
      @data_134 << row
    end

    info_all = []
    2.upto(xlsx_prop_agua_sat.last_row) do |row_num|
      info_all << Hash[headers_agua.zip(xlsx_prop_agua_sat.row(row_num))]
    end

    info_all.each do |row|
      if row["Variable"] == "H"
        entalpia_con_temp = row
      end
    end

    temp_per_presion134 = {}
    @data_134.each do |d134|
      if !temp_per_presion134[d134["P (kPa)"]].present?
        temp_per_presion134[d134["P (kPa)"]] = d134["tsat (°C)"]
      end
    end

    headers = xlsx_vc.row(2)
    result_hash = {}
    presion_per_temp = {}
    result_vap = {}

    3.upto(xlsx_vc.last_row) do |row_num|
      info_all = Hash[headers.zip(xlsx_vc.row(row_num))]
      
      if info_all["Variable"] == "V"
        result_hash[info_all["tsat (°C)"]] = info_all["liq.sat."]
        presion_per_temp[info_all["tsat (°C)"]] = info_all["P (kPa)"]
        result_vap[info_all["tsat (°C)"]] = info_all["vap.sat."]
      end
    end

    @q = @numerical_question.template

    @task= Task.find(params[:task_id])
    if !UserQuestionValue.find_by(user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id).present?
      information_question = NumericalQuestion.generate_question(@numerical_question.question)
      @enunciado = information_question["pregunta"]
      information_question.each do |key, value|
        if key != "pregunta"
          entry = UserQuestionValue.create(user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id, value_name: key, value: value, statement: @enunciado)
          if key == "temperatura_C_vap"
            @volumen_agua_saturada = result_hash[value]
            @presion_sat_temp = presion_per_temp[value]
            @volumen_vapor_saturado = result_vap[value]
          end
          if key == "t_agua_sat"
            @entalpia_esp = entalpia_con_temp[value]
          end
          if key == "presion_134a"
            @temp_134 = temp_per_presion134[value]
          end
        end
      end
    else
      #variables para calcular respuesta
      if @numerical_question.template == 1
        @masa_kg_val = UserQuestionValue.find_by(value_name: "masa_kg", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @presion = UserQuestionValue.find_by(value_name: "presion_saturacion", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
      elsif @numerical_question.template == 2
        @p1 = UserQuestionValue.find_by(value_name: "p1", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @v1 = UserQuestionValue.find_by(value_name: "v1", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @p2 = UserQuestionValue.find_by(value_name: "p2", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @v2 = UserQuestionValue.find_by(value_name: "v2", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
      elsif @numerical_question.template == 3
        @masa_kg_val = UserQuestionValue.find_by(value_name: "masa_kg", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @t_agua_sat = UserQuestionValue.find_by(value_name: "t_agua_sat", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value].to_i
        @entalpia_esp = entalpia_con_temp[@t_agua_sat]
      elsif @numerical_question.template == 4
        @t1 = UserQuestionValue.find_by(value_name: "t1", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @v1 = UserQuestionValue.find_by(value_name: "v1", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @v2 = UserQuestionValue.find_by(value_name: "v2", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
        @n = UserQuestionValue.find_by(value_name: "n", user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id)[:value]
      elsif @numerical_question.template == 5
        temp_cVap = UserQuestionValue.find_by(value_name: "temperatura_C_vap", user_id: current_user.id, task_id: @task.id)[:value]
        @presion_sat_temp = presion_per_temp[temp_cVap]
        @volumen_agua_saturada = result_hash[temp_cVap]
        @volumen_vapor_saturado = result_vap[temp_cVap]
        @masa_total = UserQuestionValue.find_by(value_name: "masa_kg", user_id: current_user.id, task_id: @task.id)[:value]
        @masa_agua = UserQuestionValue.find_by(value_name: "masa_kg_men", user_id: current_user.id, task_id: @task.id)[:value]
        @masa_vap = @masa_total - @masa_agua
      elsif @numerical_question.template == 6
        @presion_134a = UserQuestionValue.find_by(value_name: "presion_134a", user_id: current_user.id, task_id: @task.id)[:value]
        if @presion_134a.to_i == @presion_134a
          @temp_134 = temp_per_presion134[@presion_134a.to_i]
        else
          @temp_134 = temp_per_presion134[@presion_134a]
        end
      end

      if UserQuestionValue.find_by(value_name: "temperatura_C_vap", user_id: current_user.id, task_id: @task.id).present?
        @valor_temp = UserQuestionValue.find_by(value_name: "temperatura_C_vap", user_id: current_user.id, task_id: @task.id)[:value]
        @volumen_agua_saturada = result_hash[@valor_temp]
      end
      @enunciado = UserQuestionValue.find_by(user_id: current_user.id, numerical_question_id: @numerical_question.id, task_id: @task.id).statement
    end


    if @numerical_question.template == 1
      @two_answer = false
      @respuesta = @volumen_agua_saturada*UserQuestionValue.find_by(value_name: "masa_kg", user_id: current_user.id, task_id: @task.id)[:value]
    end
    if @numerical_question.template == 2
      @p1 = UserQuestionValue.find_by(value_name: "p1", user_id: current_user.id, task_id: @task.id)[:value]
      @p2 = UserQuestionValue.find_by(value_name: "p2", user_id: current_user.id, task_id: @task.id)[:value]
      @v1 = UserQuestionValue.find_by(value_name: "v1", user_id: current_user.id, task_id: @task.id)[:value]
      @v2 = UserQuestionValue.find_by(value_name: "v2", user_id: current_user.id, task_id: @task.id)[:value]
      if @p2 && @v2 && @p1 && @v1
        @respuesta1 = 2.5 * (@p2 * @v2 - @p1 * @v1)
      else
        @respuesta1 = 0  # O cualquier otro valor predeterminado que sea apropiado
      end
      @respuesta2 = @respuesta1 / 2.5
      @two_answer = true
    end
    if @numerical_question.template == 3
      @two_answer = false
      @respuesta = (@entalpia_esp - 200)/(@masa_kg_val * @t_agua_sat)
    end
    if @numerical_question.template == 4
      @two_answer = true
      @respuesta1 = @n * 8.314 * @t1 * Math.log((@v2/@v1),2.718281828459)
      @respuesta2 = @respuesta1
    end
    if @numerical_question.template == 5
      @two_answer = true
      @respuesta1 = @presion_sat_temp
      @respuesta2 = @masa_agua * @volumen_agua_saturada + @masa_vap * @volumen_vapor_saturado
    end
    if @numerical_question.template == 6
      @two_answer = false
      @respuesta = @temp_134
    end

    error_counter_table = ErrorCountNumerical.find_by(numerical_question_id: @numerical_question.id, user_id: current_user.id, task_id: @task.id)
    @show_hint = error_counter_table.hint_show
    @error_count = error_counter_table.error_count
    if @error_count == 0 || @error_count == 2
      if !@two_answer
        @final_answer = UserQuestionValue.find_by(numerical_question_id: @numerical_question.id, user_id: current_user.id, value_name: "inputAnswer", task_id: @task.id)[:value]
      end
      if @two_answer
        @final_answer_a = UserQuestionValue.find_by(numerical_question_id: @numerical_question.id, user_id: current_user.id, value_name: "inputAnswerA", task_id: @task.id)[:value]
        @final_answer_b = UserQuestionValue.find_by(numerical_question_id: @numerical_question.id, user_id: current_user.id, value_name: "inputAnswerB", task_id: @task.id)[:value]
      end
    end
  end

  def update_error_counter

    @task = Task.find(params[:task_id])

    new_error_counter = params[:error_counter].to_i

    numerical = NumericalQuestion.find(params[:id])
    error_counter_table = ErrorCountNumerical.find_by(numerical_question_id: numerical.id, user_id: current_user.id, task_id: @task.id)

    # if new_error_counter == 0
    #   task.correct_count = task.correct_count + 1
    # end

    if new_error_counter != 0
      error_counter_table.hint_show = true
    end
    if (new_error_counter == 0 || new_error_counter == 2) && params[:cantidad_respuestas] == "one"
      input_value = params[:input_value].to_f
      entry = UserQuestionValue.create(user_id: current_user.id, value_name: "inputAnswer", value: input_value, numerical_question_id: numerical.id, task_id: @task.id)
      entry.save
    end
    if (new_error_counter == 0 || new_error_counter == 2) && params[:cantidad_respuestas] == "two"
      input_valueA = params[:input_valueA].to_f
      input_valueB = params[:input_valueB].to_f
      entry = UserQuestionValue.create(user_id: current_user.id, value_name: "inputAnswerA", value: input_valueA, numerical_question_id: numerical.id, task_id: @task.id)
      entry = UserQuestionValue.create(user_id: current_user.id, value_name: "inputAnswerB", value: input_valueB, numerical_question_id: numerical.id, task_id: @task.id)
      entry.save
    end
    error_counter_table.error_count = new_error_counter

    error_counter_table.save

    user_task = UserTask.find_by(user_id: current_user.id, task_id: @task.id)
    user_task.attempt = user_task.attempt + 1

    if user_task.attempt == 2
      user_task.status = 2
    end

    user_task.save

    respond_to do |format|
      format.js {render inline: "location.reload();" }
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