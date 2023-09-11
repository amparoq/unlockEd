# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

task1= Task.create(number: 1, status: 0)
task2= Task.create(number: 2, status: 0)
task4 = Task.create(number: 4, status: 0)

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

numerical_1 = NumericalQuestion.create(difficulty: 1, question: "Un recipiente rígido contiene {{masa_kg}} kg de agua líquida saturada a {{temperatura_C_vap}}°C. Puesto que en el recipiente existen condiciones de saturación, la presión debe ser la presión de saturación a {{temperatura_C_vap}}°C, esta se muestra en la imagen: {{presion_saturacion}} kPa. Determine el volumen del recipiente en metros cúbicos.", template: 1, 
hint: "¡Recuerda fijarte en las unidades de médida!", domain: "Diagramas de fase", alter_domain: false)

j1_numerical = JoinUserNumericalQuestion.create(attempts: 0, task_id: task2.id, numerical_question_id: numerical_1.id)

n = "Se tiene un mol de un gas ideal monoatómico que experimenta un proceso adiabático en un sistema cerrado. Inicialmente, el sistema tiene una presión de {{p1}} kPa y un volumen de {{v1}} m³. Después de la expansión adiabática, la presión cambia a {{p2}} kPa y el volumen a {{v2}} m³. Si el proceso es reversible y no hay interacción de trabajo con el entorno, determine:
La variación de entalpía del sistema (ΔH) en kJ.
La variación de energía interna del sistema (ΔU) en kJ."

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