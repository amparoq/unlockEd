# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


u1= User.create(name: "David", last_name: "Diepold", user_level: 0, streak: 0, module: 0, email: "daviddiepold@gmail.com", password: "123456")

task1= Task.create(number: 1, status: 0, user_id: u1.id)

aq1= AlternativeQuestion.create(difficulty: 0, module: 0, question: "En ausencia de tablas de líquido comprimido, ¿cómo se determina el
volumen específico de un líquido comprimido a determinadas condiciones de
P y T?", alternative_a: "Utilizando ecuaciones de estado y propiedades termodinámicas
conocidas del líquido comprimido a esas condiciones de presión (P) y
temperatura (T).", alternative_b: "Empleando correlaciones empíricas basadas en datos experimentales
previos de líquidos similares bajo condiciones similares de P y T.", alternative_c: "Mediante mediciones experimentales directas del líquido
comprimido a las condiciones de presión (P) y temperatura (T) específicas
utilizando un dispositivo apropiado, como un densímetro o un picnómetro,
para determinar el volumen y calcular el volumen específico.", alternative_a_answer: "", alternative_b_answer:"",
alternative_c_answer: "", correct_alternative: "C")

aq2= AlternativeQuestion.create(difficulty: 0, module: 0, question: "¿Cuál de los siguientes diagramas de fase representa la relación entre la
presión (P) y el volumen específico (v) de una sustancia mientras se mantiene
constante la temperatura (T)?", alternative_a: "Diagrama P-T (Presión-Temperatura).", alternative_b: "Diagrama V-T (Volumen-Temperatura).", alternative_c: "Diagrama P-V (Presión-Volumen)", alternative_a_answer: "", alternative_b_answer:"",
alternative_c_answer: "", correct_alternative: "C")

aq3= AlternativeQuestion.create(difficulty: 0, module: 0, question: "En un diagrama de fase P-V-T (Presión-Volumen-Temperatura), ¿cómo se
representa el estado en el cual una sustancia coexiste en equilibrio entre su
fase líquida y vapor?", alternative_a: "Punto crítico.", alternative_b: "Línea de saturación líquido-vapor.", alternative_c: "Isoterma.", alternative_a_answer: "", alternative_b_answer:"",
alternative_c_answer: "", correct_alternative: "B")

j1= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 1, user_id: u1.id, task_id: task1.id, alternative_question_id: aq1.id)
j2= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 2, user_id: u1.id, task_id: task1.id, alternative_question_id: aq2.id)
j3= JoinUserAlternativeQuestion.create(attempts: 0, order_number: 3, user_id: u1.id, task_id: task1.id, alternative_question_id: aq3.id)

p1 = Template.create(difficulty: 2, module: "PVT", question: "Un calorímetro de cobre con masa de {{masa_calorimetro}} contiene {{masa_hielo}} de hielo. El sistema está inicialmente a {{temp_hielo}} Si al calorímetro se le agregan {{masa_vapor}} de vapor a {{temp_vapor}}: Calcule la temperatura final de equilibrio del calorímetro
CCu = 0.390[kJ/kg · K]; Cagua = 4.18[kJ/kg · K]; Lv = 2260[kJ/kg]; Lfhielo = 334[kJ/kg]")


ge = Template.generate_question(p1.question)
puts ge