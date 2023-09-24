# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Alternativas:

#Tablas de saturación
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

#Entalpía
aq4= AlternativeQuestion.create(difficulty: 0, module: 1, question: "¿Cuál de las siguientes afirmaciones describe mejor la entalpía (H) en
termodinámica?", alternative_a: "La entalpía es una medida de la energía interna de un sistema
termodinámico.", alternative_b: "La entalpía es una medida de la cantidad de calor que fluye hacia o
desde un sistema a presión constante.", alternative_c: "La entalpía es la suma de la energía interna del sistema y el
producto de su presión y volumen. Se utiliza para describir los cambios en
el contenido de energía durante procesos a presión constante.", alternative_a_answer: "Esta afirmación se refiere a la definición de energía interna, no a la entalpía (H).", alternative_b_answer:"Esta afirmación describe correctamente la entalpía en términos de flujo de calor a presión constante.",
alternative_c_answer: "", correct_alternative: "C")

aq5= AlternativeQuestion.create(difficulty: 0, module: 1, question: "¿Qué representa el cambio en la entalpía (ΔH) en un proceso químico o
físico?", alternative_a: "El cambio en la entalpía representa la variación en la cantidad de
sustancias presentes en un sistema.", alternative_b: "El cambio en la entalpía representa la variación en la energía
interna del sistema y la cantidad de calor transferido a presión constante
durante un proceso químico o físico.", alternative_c: "El cambio en la entalpía representa la variación en la temperatura de un
sistema a presión constante.", alternative_a_answer: "Esta afirmación no describe correctamente lo que representa el cambio en la entalpía (ΔH) en un proceso químico o físico.", alternative_b_answer:"",
alternative_c_answer: "Esta afirmación se refiere a la variación de temperatura, pero no es el único factor que representa el cambio en la entalpía (ΔH).", correct_alternative: "B")

aq6= AlternativeQuestion.create(difficulty: 0, module: 1, question: "¿Cuál de las siguientes afirmaciones es cierta acerca de la entalpía estándar
de formación (ΔH∘f) de una sustancia química?", alternative_a: "La entalpía estándar de formación es la energía total absorbida o
liberada por una sustancia durante su formación a partir de sus elementos
constituyentes, medida a 298 K y 1 atm.", alternative_b: "La entalpía estándar de formación es la energía interna total de una
sustancia, independiente de las condiciones en las que se forme.", alternative_c: "La entalpía estándar de formación es la cantidad de energía
absorbida o liberada cuando una sustancia se forma a partir de sus
elementos constituyentes en su estado estándar, a 298 K y 1 atm.", alternative_a_answer: "Esta afirmación no describe correctamente la entalpía estándar de formación (ΔH∘f).", alternative_b_answer:"Esta afirmación no describe correctamente la entalpía estándar de formación (ΔH∘f).",
alternative_c_answer: "", correct_alternative: "C")

aq7 = AlternativeQuestion.create(
  difficulty: 0,
  module: 1,
  question: "¿Qué representa un cambio en la entalpía (ΔH) positivo en un proceso químico?",
  alternative_a: "Un cambio en la entalpía positivo indica que el proceso es exotérmico y que el sistema libera energía hacia el entorno.",
  alternative_b: "Un cambio en la entalpía positivo indica que el proceso es endotérmico y que el sistema absorbe energía del entorno.",
  alternative_c: "Un cambio en la entalpía positivo no indica nada específico sobre el proceso químico.",
  alternative_a_answer: "Esta afirmación no describe correctamente el significado de un cambio en la entalpía (ΔH) positivo.",
  alternative_b_answer: "",
  alternative_c_answer: "Esta afirmación no proporciona una interpretación precisa de un cambio en la entalpía (ΔH) positivo.",
  correct_alternative: "B"
)

#Calor Latente

#Diagramas de fases

#Calidad de mezclas



#Numericas:

#Tablas de saturación
numerical_1 = NumericalQuestion.create(difficulty: 1, question: "Un recipiente rígido contiene {{masa_kg}} kg de agua líquida saturada a {{temperatura_C_vap}}°C. Puesto que en el recipiente existen condiciones de saturación, la presión debe ser la presión de saturación a {{temperatura_C_vap}}°C, esta se muestra en la imagen: {{presion_saturacion}} kPa. Determine el volumen del recipiente en metros cúbicos.", template: 1, 
hint: "¡Recuerda fijarte en las unidades de médida!", module: 0, alter_domain: false)

nts2 = "Un recipiente rígido contiene {{masa_kg}} kg de agua a {{temperatura_C_vap}} ºC. Si {{masa_kg_men}} kg del agua están en forma líquida y el resto como vapor, determine:
a) La presión en el recipiente
b) El volumen del recipiente"
numts2 = NumericalQuestion.create(
  difficulty: 2, question: nts2,
  template: 5,
  hint: "La presión está relacionada con la temperatura. El volumen del recipiente con los volumenes según la temperatura y además la masa.",
  module: 0, alter_domain: false
)

nts3 = "Un recipiente de {{volumen_L}} L contiene {{masa_kg}} kg de refigerante 134a a una presión de {{presion_134a}} kPa. Determine la temperatura."
numts3 = NumericalQuestion.create(
  difficulty: 0, question: nts3,
  template: 6,
  hint: "La tabla es la del refigerante, también llamado H134A.",
  module: 0, alter_domain: false
)

#Entalpía
ne1 = "Se tiene un mol de un gas ideal monoatómico que experimenta un proceso adiabático en un sistema cerrado. Inicialmente, el sistema tiene una presión de {{p1}} kPa y un volumen de {{v1}} m³. Después de la expansión adiabática, la presión cambia a {{p2}} kPa y el volumen a {{v2}} m³. Si el proceso es reversible y no hay interacción de trabajo con el entorno, determine:
a) La variación de entalpía del sistema (ΔH) en kJ.
b) La variación de energía interna del sistema (ΔU) en kJ."

nume1 = NumericalQuestion.create(difficulty: 2, question: ne1, template: 2, 
hint: "Recuerda que Cp en gases monoatómicos es (5/2)*R", module: 1, alter_domain: false)

ne2 = "Un sistema contiene {{masa_kg}} kg de agua líquida a {{t_agua_sat}} °C y 1 atm. Calcular la entalpía específica del agua en este estado, considerando que la entalpía de referencia es 200 kJ/kg a 0 °C." 
nume2 = NumericalQuestion.create(difficulty: 0, question: ne2, template: 3, hint: "Para calcular la integral ∫(Cp dT), necesitarás conocer la variación de la capacidad calorífica a lo largo del rango de temperaturas desde 0 °C hasta la temperatura que te proporcionan. Puedes utilizar datos tabulados o ecuaciones específicas para el Cp del agua a diferentes temperaturas.", module: 1, alter_domain: false)

ne3 = "{{n}} moles de un gas ideal monoatómico ocupan un volumen de {{v1}} m³ a una temperatura de {{t1}} K. Luego, se somete a un proceso isotérmico en un sistema cerrado, durante el cual su volumen cambia a {{v2}} m³. Si el proceso es reversible y no hay interacción de trabajo con el entorno, determina:
a) La variación de entalpía del sistema (ΔH) en J.
b) La variación de energía interna del sistema (ΔU) en J."
nume3 = NumericalQuestion.create(difficulty: 1, question: ne3, template: 4, hint: "Recuerda que la energía interna en procesos isotérmicos es 0", module: 1, alter_domain: false)

#Calor Latente
ncl1 = "Un bloque de hielo de {{masa_g}} g a {{temp_hielo}} °C se calienta hasta convertirse completamente en agua a {{temp_agua}} °C. El calor latente de fusión del hielo es 334 J/g y el calor específico del agua es 4.18 J/g⋅°C. ¿Cuánto calor en J se ha agregado al sistema durante este proceso?"
numcl1 = NumericalQuestion.create(
  difficulty: 1, question: ncl1,
  template: 7, hint: "Debes calcular el calor en cada cambio de fase y además en cada proceso de aumento de temperatura.",
  module: 2, alter_domain: false
)

ncl2 = "Cual es el calor latente de fusión (en KJ/Kg) de una sustancia desconocida si se necesitaron {{Q}} kj de calor para fundir {{masa_kg}} kg de este."
numcl2 = NumericalQuestion.create(
  difficulty: 0, question: ncl2,
  template: 8, hint: "El calor latente de fusión es la cantidad de calor necesaria para fundir 1 kg del material.",
  module: 2, alter_domain: false
)

ncl3 = "Un bloque de hielo de {{masa_g}} g a {{temp_hielo}} °C se calienta hasta convertirse completamente en vapor a {{temp_vapor}} °C. El calor latente de fusión del hielo es 334 J/g, el calor específico del hielo es 2,05 J/g⋅°C, el calor específico del agua es 4.18 J/g⋅°C, el calor latente de vaporización del agua es 2260 J/g y el calor específico del vapor es de 2,08 J/g·C. Determina:
a) El calor necesario para fundir el hielo en agua.
b) El calor total necesario para todo el proceso.
Calcula el calor en J."
numcl3 = NumericalQuestion.create(
  difficulty: 2, question: ncl3,
  template: 9, hint: "Debes calcular el calor en cada cambio de fase y además en cada proceso de aumento de temperatura.",
  module: 2, alter_domain: false
)

#Diagramas de fases

#PV
ndf1 = "Un gas ideal que se encuentra en un contenedor sigue el proceso que puedes ver en el diagrama PV de abajo. Los volúmenes inicial y final del gas son Vi = {{v1}} m3 y Vf = {{v2}} m3, respectivamente y sus presiones inicial y final son Pi = {{p1pa}} Pa y Pf = {{p2pa}} Pa, respectivamente. ¿Cuál es el trabajo, en J, que se hizo sobre el gas durante el proceso?"
numdf1 = NumericalQuestion.create(
  difficulty: 0, question: ndf1,
  template: 13, hint: "El trabajo es siempre P dV (área bajo la curva)",
  module: 3, alter_domain: false
)

# https://es.khanacademy.org/science/physics/thermodynamics/laws-of-thermodynamics/a/what-are-pv-diagrams

#VT
ndf2 = "Supongamos que tienes {{n}} moles de gas ideal inicialmente a {{t1C}} °C y 1 atmósfera de presión en un recipiente de {{volumen_L}} litros. El gas se calienta a presión constante hasta alcanzar {{t2C}} °C. Calcula el cambio en el volumen durante este proceso en m3.
Recuerde que 1 atm = 101.3 kPa."
numdf2 = NumericalQuestion.create(
  difficulty: 1, question: ndf2,
  template: 14, hint: "Recuerda que PV = nRT",
  module: 3, alter_domain: false
)

#PT
ndf3 = "Imagina que tienes {{n}} moles de agua en un recipiente cerrado. Se comienza con el agua en estado líquido a {{temp_agua}} °C y {{p1pa}} Pa de presión. Luego, se calienta gradualmente el agua hasta que alcance el punto de ebullición a 100°C. Calcula:
a) La cantidad de calor en J requerida para este proceso.
b) El trabajo realizado en J por o sobre los moles para el proceso.
Como el recipiente es cerrado, el proceso es isocórico. Además la masa molar del agua es 18.01 g/mol y su calor específico es 4.18 J/g·C"
numdf3 = NumericalQuestion.create(
  difficulty: 2, question: ndf3,
  template: 15, hint: "Recuerda que en procesos isocóricos el volumen es constante.",
  module: 3, alter_domain: false
)

#Calidad de mezclas
ncm1 = "Un recipiente de {{volumen_L}} L contiene {{masa_kg}} kg de refigerante 134a a una presión de {{presion_134a}} kPa. Determine la calidad de la mezcla."
numcm1 = NumericalQuestion.create(
  difficulty: 1, question: ncm1,
  template: 10, hint: "Para calcular la calidad, necesitas los volumenes de liquido saturado y vapor saturado.",
  module: 4, alter_domain: false
)

ncm2 = "Un tanque rígido de {{volumen_m3}} m3 contiene vapor a {{temp_vapor}} °C. Una tercera parte del volumen se encuentra en su fase líquida y el resto en forma de vapor. Determine el volumen del vapor y la calidad de la mezcla saturada."
numcm2 = NumericalQuestion.create(
  difficulty: 0, question: ncm2,
  template: 11, hint: "La calidad tiene que ver con el volumen.",
  module: 4, alter_domain: false
)

ncm3 = "Tienes una muestra de vapor de agua con volumen de {{volumen_L}} m3 a una temperatura desconocida. Inicialmente, la muestra consiste en {{masa_kg}} kg de vapor de agua. A medida que la muestra se enfría, parte del vapor se condensa en líquido. La mezcla llega a una temperatura de {{temperatura_C_vap}} ºC
a) ¿Cuál es la calidad de la mezcla cuando alcanza la temperatura enunciada?
b) ¿Cuánto líquido (en kg) está presente en la mezcla en la temperatura del enunciado?"
numcm3 = NumericalQuestion.create(
  difficulty: 2, question: ncm3,
  template: 12, hint: "Debes usar la tabla de vapor saturado.",
  module: 4, alter_domain: false
)

#extras

#Tasks
task1= Task.create(number: 1, complexity: 0)
task2= Task.create(number: 2, complexity: 1)
task3= Task.create(number: 3, complexity: 0)
task4 = Task.create(number: 4, complexity: 1)
task5 = Task.create(number: 5, complexity: 1)
task6 = Task.create(number: 6, complexity: 1)
task7 = Task.create(number: 7, complexity: 1)
task8 = Task.create(number: 8, complexity: 1)
task9 = Task.create(number: 9, complexity: 1)
task10 = Task.create(number: 10, complexity: 1)


j1= JoinUserAlternativeQuestion.create(order_number: 1, task_id: task1.id, alternative_question_id: aq1.id)
j2= JoinUserAlternativeQuestion.create(order_number: 2, task_id: task1.id, alternative_question_id: aq2.id)
j3= JoinUserAlternativeQuestion.create(order_number: 3, task_id: task1.id, alternative_question_id: aq3.id)

j4= JoinUserAlternativeQuestion.create(order_number: 1, task_id: task3.id, alternative_question_id: aq4.id)
j5= JoinUserAlternativeQuestion.create(order_number: 2, task_id: task3.id, alternative_question_id: aq5.id)
j6= JoinUserAlternativeQuestion.create(order_number: 3, task_id: task3.id, alternative_question_id: aq6.id)
j7= JoinUserAlternativeQuestion.create(order_number: 4, task_id: task3.id, alternative_question_id: aq7.id)

j1_numerical = JoinUserNumericalQuestion.create(task_id: task2.id, numerical_question_id: numerical_1.id)
j2_numerical = JoinUserNumericalQuestion.create(task_id: task4.id, numerical_question_id: nume1.id)

JoinUserNumericalQuestion.create(task_id: task8.id, numerical_question_id: numdf1.id)
JoinUserNumericalQuestion.create(task_id: task9.id, numerical_question_id: numdf2.id)
JoinUserNumericalQuestion.create(task_id: task10.id, numerical_question_id: numdf3.id)

u1= User.create(name: "David", last_name: "Diepold", user_level: 0, streak: 0, module: 0, email: "daviddiepold@gmail.com", password: "123456")
#Pruebas
ErrorCountNumerical.create(user_id: u1.id, numerical_question_id: numdf1.id, task_id: task8.id)
UserTask.create(user_id: u1.id, task_id: task8.id)
ErrorCountNumerical.create(user_id: u1.id, numerical_question_id: numdf2.id, task_id: task9.id)
UserTask.create(user_id: u1.id, task_id: task9.id)
ErrorCountNumerical.create(user_id: u1.id, numerical_question_id: numdf3.id, task_id: task10.id)
UserTask.create(user_id: u1.id, task_id: task10.id)

u2= User.create(name: "Hola", last_name: "Chao", user_level: 0, streak: 0, module: 0, email: "hc@gmail.com", password: "123456")
teacher = User.create(name: "Profesor", last_name: "Morales", email: "pmorales@admin.cl", password: "123456", role: 1)
