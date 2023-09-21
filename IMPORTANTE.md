LOS NUMEROS DE LAS TAREAS DEBEN SER DINAMICOS TAMBIEN PORQUE NO SE LE DARÁN a TODOS EN EL MISMO ORDEN

-Al asignarle una nueva tarea a un usuario se le debe hacer espacio en las tablas correspondientes

-Ver como manejar excels para las tablas 

EL ESTADO DE UNA TAREA DEBE ESTAR EN UserTask PORQUE DEPENDE DE CADA USUARIO, NO DE LA TAREA EN SI.

# <div id="alternative_questions">
  #   <%= f.fields_for :alternative_questions do |a| %>
  #     <%= render 'alternative_question_fields', f: a %>
  #   <% end %>
  # </div>

  # <div class="links">
  #   <%= link_to_add_association 'Agregar pregunta', f, :alternative_questions, class: 'btn btn-primary' %>
  # </div>