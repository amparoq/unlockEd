# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

task1= Task.create(number: 1, status: 0, complexity: 0)
task2= Task.create(number: 2, status: 0, complexity: 1)
task3= Task.create(number: 3, status: 0, complexity: 0)
task4 = Task.create(number: 4, status: 0, complexity: 1)

aq1= AlternativeQuestion.create(difficulty: 0, module: 0, question: "En ausencia de tablas de líquido comprimido, ¿cómo se determina el
volumen específico de un líquido comprimido a determinadas condiciones de
P y T?", alternative_a: "Utilizando ecuaciones de estado y propiedades termodinámicas
conocidas del líquido comprimido a esas condiciones de presión (P) y
temperatura (T).", alternative_b: "Empleando correlaciones empíricas basadas en datos experimentales
previos de líquidos similares bajo condiciones similares de P y T.", alternative_c: "Mediante mediciones experimentales directas del líquido
comprimido a las condiciones de presión (P) y temperatura (T) específicas
utilizando un dispositivo apropiado, como un densímetro o un picnómetro,
para determinar el volumen y calcular el volumen específico.", alternative_a_answer: "Se menciona el uso de ecuaciones de estado y propiedades termodinámicas conocidas del líquido comprimido, pero esto puede no ser suficientemente preciso, especialmente en condiciones extremas.", alternative_b_answer:"Se habla de correlaciones empíricas basadas en datos experimentales previos de líquidos similares, lo cual puede llevar a resultados imprecisos.",
alternative_c_answer: "", correct_alternative: "C")

aq2= AlternativeQuestion.create(difficulty: 0, module: 0, question: "¿Cuál de los siguientes diagramas de fase representa la relación entre la
presión (P) y el volumen específico (v) de una sustancia mientras se mantiene
constante la temperatura (T)?", alternative_a: "Diagrama P-T (Presión-Temperatura).", alternative_b: "Diagrama V-T (Volumen-Temperatura).", alternative_c: "Diagrama P-V (Presión-Volumen)", alternative_a_answer: "Se menciona el Diagrama P-T (Presión-Temperatura), pero este diagrama muestra la relación entre la presión y la temperatura, no el volumen específico.", alternative_b_answer: "Se habla del Diagrama V-T (Volumen-Temperatura), pero este diagrama muestra cómo cambia el volumen específico en función de la temperatura, sin tener en cuenta la presión.",
alternative_c_answer: "", correct_alternative: "C")

aq3= AlternativeQuestion.create(difficulty: 0, module: 0, question: "En un diagrama de fase P-V-T (Presión-Volumen-Temperatura), ¿cómo se
representa el estado en el cual una sustancia coexiste en equilibrio entre su
fase líquida y vapor?", alternative_a: "Punto crítico.", alternative_b: "Línea de saturación líquido-vapor.", alternative_c: "Isoterma.", alternative_a_answer: "El punto crítico es el límite en el cual las densidades del líquido y del vapor son iguales", alternative_b_answer:"",
alternative_c_answer: "Una reacción isoterma es una reacción donde la temperatura es constante.", correct_alternative: "B")

j1= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 1, task_id: task1.id, alternative_question_id: aq1.id)
j2= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 2, task_id: task1.id, alternative_question_id: aq2.id)
j3= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 3, task_id: task1.id, alternative_question_id: aq3.id)

aq4= AlternativeQuestion.create(difficulty: 0, module: 0, question: "¿Cuál de las siguientes afirmaciones describe mejor la entalpía (H) en
termodinámica?", alternative_a: "La entalpía es una medida de la energía interna de un sistema
termodinámico.", alternative_b: "La entalpía es una medida de la cantidad de calor que fluye hacia o
desde un sistema a presión constante.", alternative_c: "La entalpía es la suma de la energía interna del sistema y el
producto de su presión y volumen. Se utiliza para describir los cambios en
el contenido de energía durante procesos a presión constante.", alternative_a_answer: "Esta afirmación se refiere a la definición de energía interna, no a la entalpía (H).", alternative_b_answer:"Esta afirmación describe correctamente la entalpía en términos de flujo de calor a presión constante.",
alternative_c_answer: "", correct_alternative: "C")

aq5= AlternativeQuestion.create(difficulty: 0, module: 0, question: "¿Qué representa el cambio en la entalpía (ΔH) en un proceso químico o
físico?", alternative_a: "El cambio en la entalpía representa la variación en la cantidad de
sustancias presentes en un sistema.", alternative_b: "El cambio en la entalpía representa la variación en la energía
interna del sistema y la cantidad de calor transferido a presión constante
durante un proceso químico o físico.", alternative_c: "El cambio en la entalpía representa la variación en la temperatura de un
sistema a presión constante.", alternative_a_answer: "Esta afirmación no describe correctamente lo que representa el cambio en la entalpía (ΔH) en un proceso químico o físico.", alternative_b_answer:"",
alternative_c_answer: "Esta afirmación se refiere a la variación de temperatura, pero no es el único factor que representa el cambio en la entalpía (ΔH).", correct_alternative: "B")

aq6= AlternativeQuestion.create(difficulty: 0, module: 0, question: "¿Cuál de las siguientes afirmaciones es cierta acerca de la entalpía estándar
de formación (ΔH∘f) de una sustancia química?", alternative_a: "La entalpía estándar de formación es la energía total absorbida o
liberada por una sustancia durante su formación a partir de sus elementos
constituyentes, medida a 298 K y 1 atm.", alternative_b: "La entalpía estándar de formación es la energía interna total de una
sustancia, independiente de las condiciones en las que se forme.", alternative_c: "La entalpía estándar de formación es la cantidad de energía
absorbida o liberada cuando una sustancia se forma a partir de sus
elementos constituyentes en su estado estándar, a 298 K y 1 atm.", alternative_a_answer: "Esta afirmación no describe correctamente la entalpía estándar de formación (ΔH∘f).", alternative_b_answer:"Esta afirmación no describe correctamente la entalpía estándar de formación (ΔH∘f).",
alternative_c_answer: "", correct_alternative: "C")

aq7 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "¿Qué representa un cambio en la entalpía (ΔH) positivo en un proceso químico?",
  alternative_a: "Un cambio en la entalpía positivo indica que el proceso es exotérmico y que el sistema libera energía hacia el entorno.",
  alternative_b: "Un cambio en la entalpía positivo indica que el proceso es endotérmico y que el sistema absorbe energía del entorno.",
  alternative_c: "Un cambio en la entalpía positivo no indica nada específico sobre el proceso químico.",
  alternative_a_answer: "Esta afirmación no describe correctamente el significado de un cambio en la entalpía (ΔH) positivo.",
  alternative_b_answer: "",
  alternative_c_answer: "Esta afirmación no proporciona una interpretación precisa de un cambio en la entalpía (ΔH) positivo.",
  correct_alternative: "B"
)

j4= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 1, task_id: task3.id, alternative_question_id: aq4.id)
j5= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 2, task_id: task3.id, alternative_question_id: aq5.id)
j6= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 3, task_id: task3.id, alternative_question_id: aq6.id)
j7= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 4, task_id: task3.id, alternative_question_id: aq7.id)

numerical_1 = NumericalQuestion.create(difficulty: 1, question: "Un recipiente rígido contiene {{masa_kg}} kg de agua líquida saturada a {{temperatura_C_vap}}°C. Puesto que en el recipiente existen condiciones de saturación, la presión debe ser la presión de saturación a {{temperatura_C_vap}}°C, esta se muestra en la imagen: {{presion_saturacion}} kPa. Determine el volumen del recipiente en metros cúbicos.", template: 1, 
hint: "¡Recuerda fijarte en las unidades de médida!", domain: "Diagramas de fase", alter_domain: false)

j1_numerical = JoinUserNumericalQuestion.create(attempts: 0, task_id: task2.id, numerical_question_id: numerical_1.id)

n = "Se tiene un mol de un gas ideal monoatómico que experimenta un proceso adiabático en un sistema cerrado. Inicialmente, el sistema tiene una presión de {{p1}} kPa y un volumen de {{v1}} m³. Después de la expansión adiabática, la presión cambia a {{p2}} kPa y el volumen a {{v2}} m³. Si el proceso es reversible y no hay interacción de trabajo con el entorno, determine:
a) La variación de entalpía del sistema (ΔH) en kJ.
b) La variación de energía interna del sistema (ΔU) en kJ."

numerical_2 = NumericalQuestion.create(difficulty: 2, question: n, template: 2, 
hint: "Recuerda que Cp en gases monoatómicos es (5/2)*R", domain: "Entalpía", alter_domain: false)

j2_numerical = JoinUserNumericalQuestion.create(attempts: 0, task_id: task4.id, numerical_question_id: numerical_2.id)

u1= User.create(name: "David", last_name: "Diepold", user_level: 0, streak: 0, module: 0, email: "daviddiepold@gmail.com", password: "123456")
u2= User.create(name: "Hola", last_name: "Chao", user_level: 0, streak: 0, module: 0, email: "hc@gmail.com", password: "123456")


# t.integer "attempts"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.integer "user_id", null: false
#     t.integer "task_id", null: false
#     t.integer "alternative_question_id", null: false