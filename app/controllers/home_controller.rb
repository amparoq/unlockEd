class HomeController < ApplicationController
  def info_user
    user = User.find(params[:id])
  
    modulos = {}
    modulos_total = {}
    modulos_con_porcentajes= {}
    modulos_y_porcentajes= []
    modulos2= []
    modulos_total2= []
  
    UserTask.where(user_id: user.id).each do |task|
      t = Task.find(task.task_id)
  
      if !modulos.key?(t.module)
        modulos[t.module] = 1
      else
        modulos[t.module] += 1 if task.status == "completed"
      end
  
      if !modulos_total.key?(t.module)
        modulos_total[t.module] = 1
      else
        modulos_total[t.module] += 1
      end
    end

    modulos_total.each do |modulo, total|
      if modulos.key?(modulo)
        porcentaje = (modulos[modulo] / total.to_f) * 100
        modulos_con_porcentajes[modulo] = porcentaje
      else
        modulos_con_porcentajes[modulo] = 0
      end
    end

    modulos_con_porcentajes = modulos_con_porcentajes.sort.to_h
    modulos = modulos.sort.to_h
    modulos_total = modulos_total.sort.to_h
    (0...5).each do |i|
      if modulos_con_porcentajes.key?(i)
        modulos_y_porcentajes << modulos_con_porcentajes[i]
      else
        modulos_y_porcentajes << 0
      end

      if modulos.key?(i)
        modulos2<< modulos[i]
      else
        modulos2<< 0
      end

      if modulos_total.key?(i)
        modulos_total2<< modulos_total[i]
      else
        modulos_total2 << 0
      end
    end

    last_login= ((((Time.now - user.last_login) /60)/60)/24).round(1)
    use_time= ((((Time.now - user.created_at)/60)/60)/24).round(1) 

    if use_time < 1 and user.user_level >= 7
      speed= "Avanza rápido en comparación al resto"
    elsif use_time < 1 and user.user_level <= 7 and user.user_level >= 5
      speed= "Avanza mas bien rápido en comparación al resto"
    elsif use_time < 1 and user.user_level < 5 and user.user_level >= 3
      speed= "Avanza a una velocidad media en comparación al resto"
    elsif use_time < 1 and user.user_level < 3 
      speed= "Avanza lento en comparación al resto"
    end

    render json: {
      name: user.name,
      last_name: user.last_name,
      modules_percentages: modulos_y_porcentajes,
      last_login:  last_login,
      modules: modulos2,
      modules_total: modulos_total2,
      use_time: use_time,
      speed: speed
    }
  end

    def index
        @pending_tasks = UserTask.where("user_id = ? and status = ?", current_user.id, 0).map(&:task)
        @completed_or_skipped_tasks = UserTask.joins(:task).where("user_id = ? and (status = ? or status = ?) and tasks.module = ?", current_user.id, 1, 2, current_user.module).map(&:task)
        # Tablas de saturación-> 0
        # Entalpía-> 1
        # Calor latente-> 2
        # Diagramas de fases->3
        # Calidad de Mezclas-> 4
        @themes = ["Tablas de saturación", "Entalpía", "Calor Latente", "Diagrama de fases", "Calidad de mezclas"]
        
        @backgrounds_al = ["back1.png", "back2.png", "back3.png", "back4.png"]
        @colors= ["#ff5757", "#ffd357", "#95ff57", "#84feed", "#6f69fe", "#b969fe"]
        # Inicializa el diccionario
        task_scores = {}

        @current_user.user_tasks.each do |task|
          t = Task.find(task.id)  
        
          c = 0
        
          if t.join_user_alternative_questions.present?
            t.join_user_alternative_questions.each do |jaq|
              difficulty = AlternativeQuestion.find(jaq.alternative_question_id).difficulty
              if difficulty == "high"
                puts("dos")
                c += 3
              elsif difficulty == "medium"
                puts("uno")
                c += 2
              elsif difficulty == "low"
                puts("cero")
                c += 1
              end
            end
          end
        
          if t.join_user_numerical_questions.present?
            t.join_user_numerical_questions.each do |jnq|
              difficulty = NumericalQuestion.find(jnq.numerical_question_id).difficulty
              if difficulty == "high"
                puts("dos")
                c += 3
              elsif difficulty == "medium"
                puts("uno")
                c += 2
              elsif difficulty == "low"
                puts("cero")
                c += 1
              end
            end
          end
        
          task_scores[t] = c  # Asignación corregida a la variable 't'
        end
        

        # Encuentra la tarea con el mayor valor de c
        puts("hola")
        puts(task_scores)
        @task_with_max_c = task_scores.max_by { |task, c| c }
        @task_with_min_c = task_scores.min_by { |task, c| c }
      
        destacados = {}
        UserTask.all.each do |user_task|
          task = user_task.task
          buenas = ErrorCountAlternative.where(user_id: current_user.id, alternative_question_id: @a1, error_count: 0, task_id: task.id)
          malas = ErrorCountAlternative.where(user_id: current_user.id, alternative_question_id: @a1, error_count: [1, 2], task_id: task.id)
          destacados[task] = buenas.count
        end
        
        @task_destacado = destacados.max_by { |_, count| count }




      end

    def redirect_to_task
      @task = Task.find(params[:task])
      @complexity = params[:complexity]
      
      if @complexity == "Simple"
        first_alt_quest = JoinUserAlternativeQuestion.find_by(task_id: @task.id, order_number: 1)[:alternative_question_id]
        url = task_alternative_question_path(@task, first_alt_quest)
      else
        url = task_numerical_question_path(@task, @task.join_user_numerical_questions.first.numerical_question_id)
      end

      render json: { url: url }
    end
end