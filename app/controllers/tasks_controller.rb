class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    if current_user.student? 
      @tasks = UserTask.where("user_id = ?", current_user.id).map(&:task)
      @theme1 = []
      @theme2 = []
      @theme3 = []
      @theme4 = []
      @theme5 = []

      @themes = ["Tablas de saturación", "Entalpía", "Calor Latente", "Diagrama de fases", "Calidad de mezclas"]
        
      @backgrounds_al = ["back1.png", "back2.png", "back3.png", "back4.png"]
      
      @tasks.each do |h|
        if h.module == 0
          @theme1 << h
        end
        if h.module == 1
          @theme2 << h
        end
        if h.module == 2
          @theme3 << h
        end
        if h.module == 3
          @theme4 << h
        end
        if h.module == 4
          @theme5 << h
        end
      end
    else
      @tasks = Task.all
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
    update_attempt(params[:id])
    @a1 = alternative_question_ids = AlternativeQuestion.joins(:join_user_alternative_questions)
    .where(join_user_alternative_questions: { task_id: @task.id })
    .pluck(:id)
    @usertask = UserTask.find_by(user_id: current_user.id, task_id: @task.id)
    @buenas = ErrorCountAlternative.where(user_id: current_user.id, alternative_question_id: @a1, error_count: 0, task_id: @task.id)
    @malas = ErrorCountAlternative.where(user_id: current_user.id, alternative_question_id: @a1, error_count: [1, 2], task_id: @task.id)
    if !@malas.present?
      @usertask.attempt = 2
      @usertask.save
    end 
    @attempt = @usertask.attempt
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

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    cant_preguntas = task_params[:cant_preguntas].to_i
    @task = Task.new(module: task_params[:module].to_i, complexity: task_params[:complexity].to_i)

    respond_to do |format|
      if @task.save
        format.html { redirect_to new_task_alternative_question_path(@task, cant_preguntas: cant_preguntas), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.fetch(:task, {}).permit(:module, :complexity)
    end
end
