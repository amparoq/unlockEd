class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    if current_user.student? 
      @tasks = UserTask.where("user_id = ?", current_user.id).map(&:task)
    else
      @tasks = Task.all
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
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
