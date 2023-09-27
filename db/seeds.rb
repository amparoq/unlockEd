# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Alternativas:

#Tablas de saturación
aqts1 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "¿Qué información se puede encontrar en una tabla de saturación de vapor de agua?",
  alternative_a: "Propiedades termodinámicas de líquidos en diferentes estados de agregación.",
  alternative_b: "Relaciones entre la presión y la temperatura en un gas ideal.",
  alternative_c: "Relaciones entre la presión, la temperatura y las propiedades termodinámicas del vapor y el líquido saturados.",
  alternative_a_answer: "Es una tabla de agua, no de cualquier líquido.",
  alternative_b_answer: "Es una tabla de agua, no de cualquier gas ideal.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqts2 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "¿En una tabla de saturación, cómo se suele representar la relación entre la presión y la temperatura para un líquido-vapor?",
  alternative_a: "Con curvas y líneas que indican la presión de saturación en función de la temperatura.",
  alternative_b: "Mediante una ecuación algebraica compleja.",
  alternative_c: "Con una serie de puntos dispersos en un gráfico.",
  alternative_a_answer: "",
  alternative_b_answer: "No es común representar la relación entre la presión y la temperatura en una tabla de saturación mediante ecuaciones algebraicas complejas. En lugar de eso, se utiliza una representación gráfica más intuitiva.",
  alternative_c_answer: "Las tablas de saturación generalmente no contienen puntos dispersos en un gráfico, ya que esto dificultaría la lectura y la interpolación de datos.",
  correct_alternative: "A"
)

aqts3 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "¿Qué es la entalpía de vaporización en una tabla de saturación?",
  alternative_a: "La energía interna de un vapor a una temperatura específica.",
  alternative_b: "La cantidad de calor necesaria para convertir un líquido en vapor a temperatura constante.",
  alternative_c: "La energía cinética promedio de las moléculas de un líquido a su punto de ebullición.",
  alternative_a_answer: "No describe con precisión lo que representa la entalpía de vaporización en una tabla de saturación.",
  alternative_b_answer: "",
  alternative_c_answer: "No se refiere adecuadamente a la entalpía de vaporización, sino que se relaciona con la energía cinética promedio de las moléculas en un líquido.",
  correct_alternative: "B"
)

aqts4 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "En una tabla de saturación, ¿qué representa la columna de Presión?",
  alternative_a: "La presión absoluta del vapor.",
  alternative_b: "La presión relativa del vapor.",
  alternative_c: "La presión atmosférica en ese punto.",
  alternative_a_answer: "",
  alternative_b_answer: "No representa la presión relativa.",
  alternative_c_answer: "La presión atmosférica tiene que ver con el lugar donde está la mezcla",
  correct_alternative: "A"
)

aqts5 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "¿Cuál es el valor típico de la temperatura de saturación del agua a 1 atmósfera de presión según una tabla de saturación?",
  alternative_a: "0 ºC",
  alternative_b: "100 ºC",
  alternative_c: "40 ºC",
  alternative_a_answer: "Según la tabla a 0ºC, hay 0.006 atm de presión",
  alternative_b_answer: "",
  alternative_c_answer: "Según la tabla a 0ºC, hay 0.073 atm de presión",
  correct_alternative: "B"
)

aqts6 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "En una tabla de saturación, ¿cómo se representa el estado de vapor sobrecalentado?",
  alternative_a: "Con valores de temperatura y presión en la región de vapor sobrecalentado.",
  alternative_b: "Con valores de densidad y viscosidad en la región de vapor sobrecalentado.",
  alternative_c: "No se representa en la tabla de saturación.",
  alternative_a_answer: "No existe esa información sobre el vapor sobrecalentado en la tabla de saturación",
  alternative_b_answer: "No existe esa información sobre el vapor sobrecalentado en la tabla de saturación",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqts7 = AlternativeQuestion.create(
  difficulty: 2,
  module: 0,
  question: "Si la presión en una tabla de saturación es de 200 kPa y la temperatura es de 150°C, ¿qué fase predomina en ese punto?",
  alternative_a: "Fase de líquido saturado.",
  alternative_b: "Fase de vapor saturado.",
  alternative_c: "Fase de vapor sobrecalentado.",
  alternative_a_answer: "El volumen del líquido saturado es menor",
  alternative_b_answer: "",
  alternative_c_answer: "No hay fase de vapor sobrecalentado en una tabla de saturación",
  correct_alternative: "B"
)

aqts8 = AlternativeQuestion.create(
  difficulty: 1,
  module: 0,
  question: "En una tabla de saturación, ¿qué información se proporciona sobre el líquido saturado?",
  alternative_a: "Volumen específico y entalpía específica.",
  alternative_b: "Temperatura y presión.",
  alternative_c: "Volumen específico y temperatura.",
  alternative_a_answer: "",
  alternative_b_answer: "Esta información no es especificamente sobre el líquido saturado",
  alternative_c_answer: "La temperatura no es especificamente sobre el líquido saturado",
  correct_alternative: "A"
)

aqts9 = AlternativeQuestion.create(
  difficulty: 2,
  module: 0,
  question: "Si la presión en una tabla de saturación es de 500 kPa y la temperatura es de 300°C, ¿cuál es el estado del agua en ese punto?",
  alternative_a: "Vapor sobrecalentado.",
  alternative_b: "Vapor saturado.",
  alternative_c: "Líquido saturado.",
  alternative_a_answer: "",
  alternative_b_answer: "El agua no se encuentra en estado de vapor saturado a aquella temperatura y presión",
  alternative_c_answer: "No hay presencia de líquido a esa temperatura",
  correct_alternative: "A"
)

aqts10 = AlternativeQuestion.create(
  difficulty: 0,
  module: 0,
  question: "En una tabla de saturación, ¿cómo se representa el punto crítico?",
  alternative_a: "Con un símbolo de peligro.",
  alternative_b: "Con un asterisco (*).",
  alternative_c: "No se representa en la tabla de saturación.",
  alternative_a_answer: "No hay símbolos de peligro en la tabla de saturación",
  alternative_b_answer: "No hay asteríscos en ningún valor de la tabla de saturación",
  alternative_c_answer: "",
  correct_alternative: "C"
)

#Entalpía
aqe1= AlternativeQuestion.create(difficulty: 0, module: 1, question: "¿Cuál de las siguientes afirmaciones describe mejor la entalpía (H) en
termodinámica?", alternative_a: "La entalpía es una medida de la energía interna de un sistema
termodinámico.", alternative_b: "La entalpía es una medida de la cantidad de calor que fluye hacia o
desde un sistema a presión constante.", alternative_c: "La entalpía es la suma de la energía interna del sistema y el
producto de su presión y volumen. Se utiliza para describir los cambios en
el contenido de energía durante procesos a presión constante.", alternative_a_answer: "Esta afirmación se refiere a la definición de energía interna, no a la entalpía (H).", alternative_b_answer:"Esta afirmación describe correctamente la entalpía en términos de flujo de calor a presión constante.",
alternative_c_answer: "", correct_alternative: "C")

aqe2= AlternativeQuestion.create(difficulty: 0, module: 1, question: "¿Qué representa el cambio en la entalpía (ΔH) en un proceso químico o
físico?", alternative_a: "El cambio en la entalpía representa la variación en la cantidad de
sustancias presentes en un sistema.", alternative_b: "El cambio en la entalpía representa la variación en la energía
interna del sistema y la cantidad de calor transferido a presión constante
durante un proceso químico o físico.", alternative_c: "El cambio en la entalpía representa la variación en la temperatura de un
sistema a presión constante.", alternative_a_answer: "Esta afirmación no describe correctamente lo que representa el cambio en la entalpía (ΔH) en un proceso químico o físico.", alternative_b_answer:"",
alternative_c_answer: "Esta afirmación se refiere a la variación de temperatura, pero no es el único factor que representa el cambio en la entalpía (ΔH).", correct_alternative: "B")

aqe3= AlternativeQuestion.create(difficulty: 1, module: 1, question: "¿Cuál de las siguientes afirmaciones es cierta acerca de la entalpía estándar
de formación (ΔH∘f) de una sustancia química?", alternative_a: "La entalpía estándar de formación es la energía total absorbida o
liberada por una sustancia durante su formación a partir de sus elementos
constituyentes, medida a 298 K y 1 atm.", alternative_b: "La entalpía estándar de formación es la energía interna total de una
sustancia, independiente de las condiciones en las que se forme.", alternative_c: "La entalpía estándar de formación es la cantidad de energía
absorbida o liberada cuando una sustancia se forma a partir de sus
elementos constituyentes en su estado estándar, a 298 K y 1 atm.", alternative_a_answer: "Esta afirmación no describe correctamente la entalpía estándar de formación (ΔH∘f).", alternative_b_answer:"Esta afirmación no describe correctamente la entalpía estándar de formación (ΔH∘f).",
alternative_c_answer: "", correct_alternative: "C")

aqe4 = AlternativeQuestion.create(
  difficulty: 1,
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

aqe5 = AlternativeQuestion.create(
  difficulty: 1,
  module: 1,
  question: "¿Qué ocurre con la entalpía cuando un sistema absorbe calor a presión constante?",
  alternative_a: "La entalpía disminuye.",
  alternative_b: " La entalpía aumenta.",
  alternative_c: "La entalpía permanece constante.",
  alternative_a_answer: "La entalpía de un sistema es positiva cuando e sistema absorbe calor",
  alternative_b_answer: "",
  alternative_c_answer: "Si hay un cambio en el sistema, habrá un cambio en entalpía.",
  correct_alternative: "B"
)

aqe6 = AlternativeQuestion.create(
  difficulty: 0,
  module: 1,
  question: "¿Cuál es la unidad SI de la entalpía?",
  alternative_a: "Joules por gramo (J/g).",
  alternative_b: "Joules por kelvin (J/K).",
  alternative_c: "Joules (J).",
  alternative_a_answer: "La entalpía es energía, no se mide en relación a la masa",
  alternative_b_answer: "La entalpía es energía, no se mide en relación a la temperatura",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqe7 = AlternativeQuestion.create(
  difficulty: 1,
  module: 1,
  question: "En una reacción química a presión constante, si la entalpía final es menor que la entalpía inicial, ¿qué tipo de proceso es?",
  alternative_a: "Exotérmico.",
  alternative_b: "Endotérmico.",
  alternative_c: "Isotérmico.",
  alternative_a_answer: "",
  alternative_b_answer: "Un proceso endotérmico es un proceso en el cual la entalpía aumenta.",
  alternative_c_answer: "Un proceso isotérmico es un proceso a temperatura constante, no nos dice nada de la entalpía.",
  correct_alternative: "A"
)

aqe8 = AlternativeQuestion.create(
  difficulty: 2,
  module: 1,
  question: "Si la entalpía de un sistema disminuye durante una reacción a presión constante, ¿qué puede decirse sobre la energía transferida?",
  alternative_a: "Se ha absorbido calor.",
  alternative_b: "Se ha liberado calor.",
  alternative_c: "No se ha transferido calor.",
  alternative_a_answer: "En un proceso exotérmico, se libera calor",
  alternative_b_answer: "",
  alternative_c_answer: "En un proceso exotérmico, se libera calor",
  correct_alternative: "B"
)

aqe9 = AlternativeQuestion.create(
  difficulty: 1,
  module: 1,
  question: "¿Cuál es la ecuación general que relaciona la entalpía (H), la energía interna (U), la presión (P), y el volumen (V) de un sistema?",
  alternative_a: "H = U + PV",
  alternative_b: "H = U - PV",
  alternative_c: "H = U x PV",
  alternative_a_answer: "",
  alternative_b_answer: "No se le resta PV a U.",
  alternative_c_answer: "No se multiplican U y PV.",
  correct_alternative: "A"
)

aqe10 = AlternativeQuestion.create(
  difficulty: 0,
  module: 1,
  question: "¿Cuál es el signo de la entalpía en una reacción química exotérmica?",
  alternative_a: "Positivo",
  alternative_b: "Negativo",
  alternative_c: "No tiene signo",
  alternative_a_answer: "Es positivo en una reacción endotérmica.",
  alternative_b_answer: "",
  alternative_c_answer: "La entalpía es un escalar y por ende, tiene un signo que representa si el calor fue absorbido o liberado.",
  correct_alternative: "B"
)

#Calor Latente

aqcl1 = AlternativeQuestion.create(
  difficulty: 0,
  module: 2,
  question: "¿Qué representa el calor latente en un proceso de cambio de fase?",
  alternative_a: "El calor latente representa la cantidad de calor necesaria para elevar la temperatura de una sustancia en un grado.",
  alternative_b: "El calor latente representa la cantidad de calor absorbida o liberada durante un cambio de fase a temperatura constante, sin que cambie la temperatura de la sustancia.",
  alternative_c: "El calor latente representa la cantidad de calor necesaria para fundir o vaporizar una unidad de masa de una sustancia durante un cambio de fase a temperatura constante.",
  alternative_a_answer: "Esta afirmación esta definiendo la capacidad calórica.",
  alternative_b_answer: "",
  alternative_c_answer: "El calor latente también se puede dar en condensaciones o solidificaciones.",
  correct_alternative: "B"
)

aqcl2 = AlternativeQuestion.create(
  difficulty: 0,
  module: 2,
  question: "¿Cuál de las siguientes afirmaciones sobre el calor latente de vaporización es correcta?",
  alternative_a: "El calor latente de vaporización es la cantidad de calor necesaria para elevar la temperatura de un líquido hasta su punto de ebullición.",
  alternative_b: "El calor latente de vaporización es la cantidad de calor necesaria para convertir una unidad de masa de líquido en vapor, manteniendo la temperatura constante, en el punto de ebullición a presión constante.",
  alternative_c: "El calor latente de vaporización es la cantidad de calor necesaria para fundir una unidad de masa de un sólido a su punto de fusión.",
  alternative_a_answer: "En cambios de fase no hay cambio de temperatura.",
  alternative_b_answer: "",
  alternative_c_answer: "El nombre del calor latente indica que es en casos de vaporización.",
  correct_alternative: "B"
)

aqcl3 = AlternativeQuestion.create(
  difficulty: 0,
  module: 2,
  question: "¿Qué relación existe entre el calor latente de fusión y el calor latente de vaporización de una sustancia?",
  alternative_a: "El calor latente de fusión es siempre mayor que el calor latente de vaporización.",
  alternative_b: "El calor latente de fusión es igual al calor latente de vaporización.",
  alternative_c: "El calor latente de vaporización es generalmente mayor que el calor latente de fusión.",
  alternative_a_answer: "Errónea porque contradice el principio fundamental de la termodinámica que establece que el calor latente de fusión generalmente es menor que el calor latente de vaporización",
  alternative_b_answer: "Errónea porque contradice el principio fundamental de la termodinámica que establece que el calor latente de fusión generalmente es menor que el calor latente de vaporización",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqcl4 = AlternativeQuestion.create(
  difficulty: 0,
  module: 2,
  question: "¿Cuál es la unidad de medida típica para el calor latente de fusión?",
  alternative_a: "Joules por gramo (J/g).",
  alternative_b: "Joules por Kelvin (J/K).",
  alternative_c: "Joules por mol (J/mol).",
  alternative_a_answer: "",
  alternative_b_answer: "El calor latente no se relaciona con la temperatura de un objeto",
  alternative_c_answer: "El calor latente no se relaciona con los moles de un objeto",
  correct_alternative: "A"
)

aqcl5 = AlternativeQuestion.create(
  difficulty: 2,
  module: 2,
  question: "Si tienes 100 gramos de hielo a 0°C y deseas convertirlo completamente en agua líquida a 0°C, ¿cuánto calor se debe agregar?",
  alternative_a: "El calor latente de fusión del hielo.",
  alternative_b: "El calor latente de vaporización del agua.",
  alternative_c: "El calor específico del hielo.",
  alternative_a_answer: "",
  alternative_b_answer: "Se habla de un cambio de sólido a líquido, no al reves.",
  alternative_c_answer: "El calor espcífico se refiere a el calor necesario para aumentar un grado, acá se habla de cambio de fase.",
  correct_alternative: "A"
)

aqcl6 = AlternativeQuestion.create(
  difficulty: 1,
  module: 2,
  question: "¿Qué ocurre con la temperatura de una sustancia durante un cambio de fase a presión constante?",
  alternative_a: "La temperatura aumenta.",
  alternative_b: "La temperatura disminuye.",
  alternative_c: "La temperatura se mantiene constante.",
  alternative_a_answer: "La temperatura no aumenta en un cambio de fase.",
  alternative_b_answer: "La temperatura no disminuye en un cambio de fase.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqcl7 = AlternativeQuestion.create(
  difficulty: 2,
  module: 2,
  question: "¿Cuál es el calor latente de vaporización del agua a 100°C?",
  alternative_a: "0 J/g",
  alternative_b: "100 J/g",
  alternative_c: "2260 J/g",
  alternative_a_answer: "El calor latente debe tener una magnitud.",
  alternative_b_answer: "El calor latente del agua no depende de la temperatura del agua.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqcl8 = AlternativeQuestion.create(
  difficulty: 2,
  module: 2,
  question: "¿Qué propiedad termodinámica está asociada directamente con el calor latente de cambio de fase?",
  alternative_a: "Entropía",
  alternative_b: "Temperatura",
  alternative_c: "Presión",
  alternative_a_answer: "",
  alternative_b_answer: "El calor latente no depende de la temperatura del cambio de fase.",
  alternative_c_answer: "El calor latente no depende de la presión del cambio de fase.",
  correct_alternative: "A"
)

aqcl9 = AlternativeQuestion.create(
  difficulty: 0,
  module: 2,
  question: "¿Cuál de las siguientes sustancias tiene un calor latente de vaporización más alto?",
  alternative_a: "Agua",
  alternative_b: "Alcohol etílico (etanol)",
  alternative_c: "Éter dietílico",
  alternative_a_answer: "",
  alternative_b_answer: "El calor latente de vaporización del agua es de los más altos.",
  alternative_c_answer: "El calor latente de vaporización del agua es de los más altos.",
  correct_alternative: "A"
)

aqcl10 = AlternativeQuestion.create(
  difficulty: 1,
  module: 2,
  question: "¿Qué propiedad termodinámica no cambia durante un cambio de fase donde se involucra calor latente?",
  alternative_a: "Presion",
  alternative_b: "Temperatura",
  alternative_c: "Volumen",
  alternative_a_answer: "En un cambio de fase, puede cambiar la presión.",
  alternative_b_answer: "",
  alternative_c_answer: "En un cambio de fase, puede cambiar la volumen.",
  correct_alternative: "B"
)

#Diagramas de fases

aqdf1= AlternativeQuestion.create(difficulty: 0, module: 3, question: "En ausencia de tablas de líquido comprimido, ¿cómo se determina el
volumen específico de un líquido comprimido a determinadas condiciones de
P y T?", alternative_a: "Utilizando ecuaciones de estado y propiedades termodinámicas
conocidas del líquido comprimido a esas condiciones de presión (P) y
temperatura (T).", alternative_b: "Empleando correlaciones empíricas basadas en datos experimentales
previos de líquidos similares bajo condiciones similares de P y T.", alternative_c: "Mediante mediciones experimentales directas del líquido
comprimido a las condiciones de presión (P) y temperatura (T) específicas
utilizando un dispositivo apropiado, como un densímetro o un picnómetro,
para determinar el volumen y calcular el volumen específico.", alternative_a_answer: "Se menciona el uso de ecuaciones de estado y propiedades termodinámicas conocidas del líquido comprimido, pero esto puede no ser suficientemente preciso, especialmente en condiciones extremas.", alternative_b_answer:"Se habla de correlaciones empíricas basadas en datos experimentales previos de líquidos similares, lo cual puede llevar a resultados imprecisos.",
alternative_c_answer: "", correct_alternative: "C")

aqdf2= AlternativeQuestion.create(difficulty: 0, module: 3, question: "¿Cuál de los siguientes diagramas de fase representa la relación entre la
presión (P) y el volumen específico (v) de una sustancia mientras se mantiene
constante la temperatura (T)?", alternative_a: "Diagrama P-T (Presión-Temperatura).", alternative_b: "Diagrama V-T (Volumen-Temperatura).", alternative_c: "Diagrama P-V (Presión-Volumen)", alternative_a_answer: "Se menciona el Diagrama P-T (Presión-Temperatura), pero este diagrama muestra la relación entre la presión y la temperatura, no el volumen específico.", alternative_b_answer: "Se habla del Diagrama V-T (Volumen-Temperatura), pero este diagrama muestra cómo cambia el volumen específico en función de la temperatura, sin tener en cuenta la presión.",
alternative_c_answer: "", correct_alternative: "C")

aqdf3= AlternativeQuestion.create(difficulty: 0, module: 3, question: "En un diagrama de fase P-V-T (Presión-Volumen-Temperatura), ¿cómo se
representa el estado en el cual una sustancia coexiste en equilibrio entre su
fase líquida y vapor?", alternative_a: "Punto crítico.", alternative_b: "Línea de saturación líquido-vapor.", alternative_c: "Isoterma.", alternative_a_answer: "El punto crítico es el límite en el cual las densidades del líquido y del vapor son iguales", alternative_b_answer:"",
alternative_c_answer: "Una reacción isoterma es una reacción donde la temperatura es constante.", correct_alternative: "B")

aqdf4 = AlternativeQuestion.create(
  difficulty: 1,
  module: 3,
  question: "¿Cuál es la fase dominante de una sustancia en el punto triple en un diagrama de fases?",
  alternative_a: "Sólido.",
  alternative_b: "Líquido.",
  alternative_c: "Vapor (Gaseoso)",
  alternative_a_answer: "Si bien las tres coexisten en equilibrio, hay una dominante.",
  alternative_b_answer:"",
  alternative_c_answer: "Si bien las tres coexisten en equilibrio, hay una dominante.",
  correct_alternative: "B")

aqdf5 = AlternativeQuestion.create(
  difficulty: 1,
  module: 3,
  question: "En un diagrama de fases, ¿qué representa un punto dentro de la región líquido-vapor?",
  alternative_a: "Un punto crítico.",
  alternative_b: "Un punto triple.",
  alternative_c: "Una mezcla líquido vapor.",
  alternative_a_answer: "El punto crítico es un punto en la curva, no en la región bajo esta.",
  alternative_b_answer:"El punto triple tiene que ver con las tres fases en equilibrio, no solo líquido-vapor.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

  aqdf6 = AlternativeQuestion.create(
    difficulty: 0,
    module: 3,
    question: "¿Qué tipo de cambio de fase ocurre cuando se sigue una línea en un diagrama de fases?",
    alternative_a: "Fusión.",
    alternative_b: "Vaporización.",
    alternative_c: "Sublimación.",
    alternative_a_answer: "La fusión es lo que se obtiene al seguir la línea inversamente.",
    alternative_b_answer: "",
    alternative_c_answer: "La sublimación no considera el estado líquido.",
    correct_alternative: "B"
  )

  aqdf7 = AlternativeQuestion.create(
    difficulty: 2,
    module: 3,
    question: "En un diagrama de fases, ¿qué representa la línea que separa la región líquido-vapor de la región de vapor?",
    alternative_a: "Punto triple.",
    alternative_b: "Límite de estabilidad del vapor.",
    alternative_c: "Línea de solidificación.",
    alternative_a_answer: "Esto es un punto en el gráfico no una línea.",
    alternative_b_answer: "",
    alternative_c_answer: "La región de líquido-vapor no podría contemplar una linea de solidificación porque este proceso no existe entre ambos estados.",
    correct_alternative: "B"
  )

  aqdf8 = AlternativeQuestion.create(
    difficulty: 1,
    module: 3,
    question: "En un diagrama de fases, ¿qué representa un punto en la línea que separa el líquido del vapor?",
    alternative_a: "Punto crítico.",
    alternative_b: "Punto de fusión.",
    alternative_c: "Punto de ebullición.",
    alternative_a_answer: "El punto crítico no se encuentra en la línea que separa el líquido del vapor en un diagrama de fases. El punto crítico es un punto específico en el diagrama, pero no está en esa línea.",
    alternative_b_answer: "El punto de fusión representa el cambio de fase entre sólido y líquido, que ocurre en otra parte del diagrama, no la línea que separa el líquido del vapor",
    alternative_c_answer: "",
    correct_alternative: "C"
  )

  aqdf9 = AlternativeQuestion.create(
    difficulty: 2,
    module: 3,
    question: "¿Cuál es el punto en un diagrama de fases donde se alcanza la máxima temperatura y presión en la fase líquida?",
    alternative_a: "Punto crítico.",
    alternative_b: "Punto de fusión.",
    alternative_c: "Punto de sublimación.",
    alternative_a_answer: "",
    alternative_b_answer: "El punto de fusión representa el cambio de fase entre sólido y líquido.",
    alternative_c_answer: "El punto de sublimación representa el cambio de fase entre sólido y vapor.",
    correct_alternative: "A"
  )

  aqdf10 = AlternativeQuestion.create(
    difficulty: 1,
    module: 3,
    question: "En un diagrama de fases, ¿qué representa un punto dentro de la región sólido-líquido?",
    alternative_a: "Un punto de congelación.",
    alternative_b: "Un punto crítico.",
    alternative_c: "Una mezcla de sólido-líquido.",
    alternative_a_answer: "",
    alternative_b_answer: "Un punto dentro de la región sólido-líquido no corresponde a un punto crítico en un diagrama de fases. El punto crítico es un punto específico en el diagrama, pero no se encuentra dentro de la región sólido-líquido.",
    alternative_c_answer: "Un punto dentro de la región sólido-líquido no necesariamente representa una mezcla sólido-líquido. Puede representar un estado sólido o líquido puro en equilibrio, no una mezcla.",
    correct_alternative: "A"
  )

#Calidad de mezclas

aqcm2 = AlternativeQuestion.create(
  difficulty: 0,
  module: 4,
  question: "En el contexto de mezclas líquido-vapor, ¿cómo se define la calidad de una mezcla y cuál es su rango típico?",
  alternative_a: "La calidad es la fracción de masa de líquido presente en una mezcla. Su rango típico varía entre 0 y 1.",
  alternative_b: "La calidad es la proporción de volumen de vapor en una mezcla. Su rango típico puede variar entre -1 y 1.",
  alternative_c: "La calidad es la fracción de masa de vapor presente en una mezcla bifásica líquido-vapor. Su rango típico va desde 0 (solo líquido) hasta 1 (solo vapor).",
  alternative_a_answer: "Incorrecta porque no define adecuadamente la calidad en el contexto de mezclas líquido-vapor y proporciona un rango incorrecto.",
  alternative_b_answer: "Está incorrecta porque define incorrectamente la calidad en términos de proporción de volumen y proporciona un rango inapropiado.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqcm1 = AlternativeQuestion.create(
  difficulty: 0,
  module: 4,
  question: "¿Qué es la calidad? ¿Tiene algún significado en la región de vapor sobrecalentado?",
  alternative_a: "La calidad se refiere a la proporción de masa de vapor en una mezcla bifásica líquido-vapor. En la región de vapor sobrecalentado, la calidad no es relevante ya que solo hay vapor presente y la calidad sería 1.",
  alternative_b: "La calidad es una medida de cuán puro es un vapor en términos de sus componentes químicos. En la región de vapor sobrecalentado, la calidad es importante para determinar la concentración de impurezas en el vapor.",
  alternative_c: "La calidad es la fracción de la masa total de una mezcla que está en forma de vapor. En la región de vapor sobrecalentado, la calidad no es relevante ya que el fluido está completamente en estado de vapor y la calidad sería 1, indicando la ausencia de fase líquida.",
  alternative_a_answer: "No describe adecuadamente la calidad en la región de vapor sobrecalentado.",
  alternative_b_answer: "No se refiere con precisión a lo que representa la calidad y su relevancia en la región de vapor sobrecalentado.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqcm3 = AlternativeQuestion.create(
  difficulty: 0,
  module: 4,
  question: "¿Qué relación tiene la calidad en una mezcla líquido-vapor con respecto a la fracción de masa de cada fase y cómo se calcula?",
  alternative_a: "La calidad es igual a la fracción de masa de vapor dividida por la fracción de masa de vapor más la fracción de masa de líquido en la mezcla.",
  alternative_b: "La calidad es igual a la fracción de masa de líquido dividida por la fracción de masa total de la mezcla.",
  alternative_c: "La calidad es igual a la fracción de masa de vapor dividida por la fracción de masa total de la mezcla.",
  alternative_a_answer: "",
  alternative_b_answer: "Proporciona una fórmula incorrecta para calcular la calidad en una mezcla líquido-vapor.",
  alternative_c_answer: "No describe adecuadamente la relación de la calidad con respecto a la fracción de masa de cada fase y proporciona una fórmula incorrecta.",
  correct_alternative: "A"
)

aqcm4 = AlternativeQuestion.create(
  difficulty: 1,
  module: 4,
  question: "¿Qué valor de calidad corresponde a un estado donde solo hay vapor presente en una mezcla líquido-vapor?",
  alternative_a: "Calidad igual a 0",
  alternative_b: "Calidad igual a 1",
  alternative_c: "Calidad igual a -1",
  alternative_a_answer: "La calidad igual a 0 significa que la mezcla está completamente en estado líquido.",
  alternative_b_answer: "",
  alternative_c_answer: "La calidad no puede ser un valor negativo en este contexto.",
  correct_alternative: "B"
)

aqcm5 = AlternativeQuestion.create(
  difficulty: 1,
  module: 4,
  question: "¿Qué valor de calidad corresponde a un estado donde solo hay líquido presente en una mezcla líquido-vapor?",
  alternative_a: "Calidad igual a 0",
  alternative_b: "Calidad igual a 1",
  alternative_c: "Calidad igual a -1",
  alternative_a_answer: "",
  alternative_b_answer: "La calidad igual a 1 significa que la mezcla tiene ausencia de fase líquida.",
  alternative_c_answer: "La calidad no puede ser un valor negativo en este contexto.",
  correct_alternative: "A"
)

aqcm6 = AlternativeQuestion.create(
  difficulty: 2,
  module: 4,
  question: "¿Qué se entiende por mezcla bifásica líquido-vapor?",
  alternative_a: "Una mezcla de dos líquidos en diferentes proporciones.",
  alternative_b: "Una mezcla que contiene solo líquido y vapor en cantidades iguales.",
  alternative_c: "Una mezcla que contiene tanto líquido como vapor en diferentes proporciones.",
  alternative_a_answer: "Esta alternativa se refiere a una mezcla de dos líquidos, no a una mezcla bifásica.",
  alternative_b_answer: "La alternativa es incorrecta porque limita la definición a cantidades iguales de líquido y vapor, lo cual no es necesario.",
  alternative_c_answer: "",
  correct_alternative: "C"
)

aqcm7 = AlternativeQuestion.create(
  difficulty: 1,
  module: 4,
  question: "¿Qué representa una calidad de 0.5 en una mezcla líquido-vapor?",
  alternative_a: "Indica que la mezcla está en su punto de congelación.",
  alternative_b: "Significa que la mezcla está compuesta por igual cantidad de líquido y vapor en masa.",
  alternative_c: "Indica que la mezcla está en su punto de ebullición.",
  alternative_a_answer: "Esta alternativa no representa adecuadamente el significado de una calidad de 0.5 en este contexto.",
  alternative_b_answer: "",
  alternative_c_answer: "Esta alternativa no representa adecuadamente el significado de una calidad de 0.5 en este contexto.",
  correct_alternative: "B"
)

aqcm8 = AlternativeQuestion.create(
  difficulty: 2,
  module: 4,
  question: "¿En qué región de un diagrama de fases se encuentra una mezcla con calidad igual a 0.7?",
  alternative_a: "Región de líquido saturado.",
  alternative_b: "Región de vapor saturado.",
  alternative_c: "Región de vapor sobrecalentado.",
  alternative_a_answer: "",
  alternative_b_answer: "En la región de vapor saturado, la calidad es igual a 1",
  alternative_c_answer: "En la región de vapor sobrecalentado, la calidad es mayor que 1.",
  correct_alternative: "A"
)

aqcm9 = AlternativeQuestion.create(
  difficulty: 1,
  module: 4,
  question: "En una mezcla líquido-vapor, ¿qué valor de calidad indicaría que la mezcla está en su punto de ebullición?",
  alternative_a: "Calidad igual a 0",
  alternative_b: "Calidad igual a 0.5",
  alternative_c: "Calidad igual a 1",
  alternative_a_answer: "Una calidad igual a 0 representa la ausencia de fase vapor.",
  alternative_b_answer: "",
  alternative_c_answer: "Una calidad igual a 1 representa la ausencia de fase líquida.",
  correct_alternative: "B"
)

aqcm10 = AlternativeQuestion.create(
  difficulty: 1,
  module: 4,
  question: " ¿En qué estado se encuentra una mezcla líquido-vapor con calidad de 0.2?",
  alternative_a: "Principalmente en estado líquido",
  alternative_b: "Principalmente en estado vapor",
  alternative_c: "Equitativamente distribuida entre líquido y vapor",
  alternative_a_answer: "",
  alternative_b_answer: "Una calidad de 0.2 no indica predominancia de vapor.",
  alternative_c_answer: "La alternativa es incorrecta porque no representa adecuadamente una calidad de 0.2.",
  correct_alternative: "A"
)
#Numericas:

#Tablas de saturación
numerical_1 = NumericalQuestion.create(difficulty: 1, question: "Un recipiente rígido contiene {{masa_kg}} kg de agua líquida saturada a {{temperatura_C_vap}}°C. Puesto que en el recipiente existen condiciones de saturación, la presión debe ser la presión de saturación a {{temperatura_C_vap}}°C, esta se muestra en la imagen: {{presion_saturacion}} kPa. Determine el volumen del recipiente en metros cúbicos.", template: 1, 
hint: "¡Recuerda fijarte en las unidades de médida!", module: 0)

nts2 = "Un recipiente rígido contiene {{masa_kg}} kg de agua a {{temperatura_C_vap}} ºC. Si {{masa_kg_men}} kg del agua están en forma líquida y el resto como vapor, determine:
a) La presión en el recipiente
b) El volumen del recipiente"
numts2 = NumericalQuestion.create(
  difficulty: 2, question: nts2,
  template: 5,
  hint: "La presión está relacionada con la temperatura. El volumen del recipiente con los volumenes según la temperatura y además la masa.",
  module: 0
)

nts3 = "Un recipiente de {{volumen_L}} L contiene {{masa_kg}} kg de refigerante 134a a una presión de {{presion_134a}} kPa. Determine la temperatura."
numts3 = NumericalQuestion.create(
  difficulty: 0, question: nts3,
  template: 6,
  hint: "La tabla es la del refigerante, también llamado H134A.",
  module: 0
)

#Entalpía
ne1 = "Se tiene un mol de un gas ideal monoatómico que experimenta un proceso adiabático en un sistema cerrado. Inicialmente, el sistema tiene una presión de {{p1}} kPa y un volumen de {{v1}} m³. Después de la expansión adiabática, la presión cambia a {{p2}} kPa y el volumen a {{v2}} m³. Si el proceso es reversible y no hay interacción de trabajo con el entorno, determine:
a) La variación de entalpía del sistema (ΔH) en kJ.
b) La variación de energía interna del sistema (ΔU) en kJ."

nume1 = NumericalQuestion.create(difficulty: 2, question: ne1, template: 2, 
hint: "Recuerda que Cp en gases monoatómicos es (5/2)*R", module: 1)

ne2 = "Un sistema contiene {{masa_kg}} kg de agua líquida a {{t_agua_sat}} °C y 1 atm. Calcular la entalpía específica del agua en este estado, considerando que la entalpía de referencia es 200 kJ/kg a 0 °C." 
nume2 = NumericalQuestion.create(difficulty: 0, question: ne2, template: 3, hint: "Para calcular la integral ∫(Cp dT), necesitarás conocer la variación de la capacidad calorífica a lo largo del rango de temperaturas desde 0 °C hasta la temperatura que te proporcionan. Puedes utilizar datos tabulados o ecuaciones específicas para el Cp del agua a diferentes temperaturas.", module: 1)

ne3 = "{{n}} moles de un gas ideal monoatómico ocupan un volumen de {{v1}} m³ a una temperatura de {{t1}} K. Luego, se somete a un proceso isotérmico en un sistema cerrado, durante el cual su volumen cambia a {{v2}} m³. Si el proceso es reversible y no hay interacción de trabajo con el entorno, determina:
a) La variación de entalpía del sistema (ΔH) en J.
b) El trabajo realizado por o sobre el mol en J."
nume3 = NumericalQuestion.create(difficulty: 1, question: ne3, template: 4, hint: "Recuerda que la energía interna en procesos isotérmicos es 0", module: 1)

#Calor Latente
ncl1 = "Un bloque de hielo de {{masa_g}} g a {{temp_hielo}} °C se calienta hasta convertirse completamente en agua a {{temp_agua}} °C. El calor latente de fusión del hielo es 334 J/g y el calor específico del agua es 4.18 J/g⋅°C. ¿Cuánto calor en J se ha agregado al sistema durante este proceso?"
numcl1 = NumericalQuestion.create(
  difficulty: 1, question: ncl1,
  template: 7, hint: "Debes calcular el calor en cada cambio de fase y además en cada proceso de aumento de temperatura.",
  module: 2
)

ncl2 = "Cual es el calor latente de fusión (en KJ/Kg) de una sustancia desconocida si se necesitaron {{Q}} kj de calor para fundir {{masa_kg}} kg de este."
numcl2 = NumericalQuestion.create(
  difficulty: 0, question: ncl2,
  template: 8, hint: "El calor latente de fusión es la cantidad de calor necesaria para fundir 1 kg del material.",
  module: 2
)

ncl3 = "Un bloque de hielo de {{masa_g}} g a {{temp_hielo}} °C se calienta hasta convertirse completamente en vapor a {{temp_vapor}} °C. El calor latente de fusión del hielo es 334 J/g, el calor específico del hielo es 2,05 J/g⋅°C, el calor específico del agua es 4.18 J/g⋅°C, el calor latente de vaporización del agua es 2260 J/g y el calor específico del vapor es de 2,08 J/g·C. Determina:
a) El calor necesario para fundir el hielo en agua.
b) El calor total necesario para todo el proceso.
Calcula el calor en J."
numcl3 = NumericalQuestion.create(
  difficulty: 2, question: ncl3,
  template: 9, hint: "Debes calcular el calor en cada cambio de fase y además en cada proceso de aumento de temperatura.",
  module: 2
)

#Diagramas de fases

#PV
ndf1 = "Un gas ideal que se encuentra en un contenedor sigue el proceso que puedes ver en el diagrama PV de abajo. Los volúmenes inicial y final del gas son Vi = {{v1}} m3 y Vf = {{v2}} m3, respectivamente y sus presiones inicial y final son Pi = {{p1pa}} Pa y Pf = {{p2pa}} Pa, respectivamente. ¿Cuál es el trabajo, en J, que se hizo sobre el gas durante el proceso?"
numdf1 = NumericalQuestion.create(
  difficulty: 0, question: ndf1,
  template: 13, hint: "El trabajo es siempre P dV (área bajo la curva)",
  module: 3
)

# https://es.khanacademy.org/science/physics/thermodynamics/laws-of-thermodynamics/a/what-are-pv-diagrams

#VT
ndf2 = "Supongamos que tienes {{n}} moles de gas ideal inicialmente a {{t1C}} °C y 1 atmósfera de presión en un recipiente de {{volumen_L}} litros. El gas se calienta a presión constante hasta alcanzar {{t2C}} °C. Calcula el cambio en el volumen durante este proceso en m3.
Recuerde que 1 atm = 101.3 kPa."
numdf2 = NumericalQuestion.create(
  difficulty: 1, question: ndf2,
  template: 14, hint: "Recuerda que PV = nRT",
  module: 3
)

#PT
ndf3 = "Imagina que tienes {{n}} moles de agua en un recipiente cerrado. Se comienza con el agua en estado líquido a {{temp_agua}} °C y {{p1pa}} Pa de presión. Luego, se calienta gradualmente el agua hasta que alcance el punto de ebullición a 100°C. Calcula:
a) La cantidad de calor en J requerida para este proceso.
b) El trabajo realizado en J por o sobre los moles para el proceso.
Como el recipiente es cerrado, el proceso es isocórico. Además la masa molar del agua es 18.01 g/mol y su calor específico es 4.18 J/g·C"
numdf3 = NumericalQuestion.create(
  difficulty: 2, question: ndf3,
  template: 15, hint: "Recuerda que en procesos isocóricos el volumen es constante.",
  module: 3
)

#Calidad de mezclas
ncm1 = "Un recipiente de {{volumen_L}} L contiene {{masa_kg}} kg de refigerante 134a a una presión de {{presion_134a}} kPa. Determine la calidad de la mezcla."
numcm1 = NumericalQuestion.create(
  difficulty: 1, question: ncm1,
  template: 10, hint: "Para calcular la calidad, necesitas los volumenes de liquido saturado y vapor saturado.",
  module: 4
)

ncm2 = "Un tanque rígido de {{volumen_m3}} m3 contiene vapor a {{temp_vapor}} °C. Una tercera parte del volumen se encuentra en su fase líquida y el resto en forma de vapor. Determine el volumen del vapor y la calidad de la mezcla saturada."
numcm2 = NumericalQuestion.create(
  difficulty: 0, question: ncm2,
  template: 11, hint: "La calidad tiene que ver con el volumen.",
  module: 4
)

ncm3 = "Tienes una muestra de vapor de agua con volumen de {{volumen_L}} m3 a una temperatura desconocida. Inicialmente, la muestra consiste en {{masa_kg}} kg de vapor de agua. A medida que la muestra se enfría, parte del vapor se condensa en líquido. La mezcla llega a una temperatura de {{temperatura_C_vap}} ºC
a) ¿Cuál es la calidad de la mezcla cuando alcanza la temperatura enunciada?
b) ¿Cuánto líquido (en kg) está presente en la mezcla en la temperatura del enunciado?"
numcm3 = NumericalQuestion.create(
  difficulty: 2, question: ncm3,
  template: 12, hint: "Debes usar la tabla de vapor saturado.",
  module: 4
)

#extras

#Tasks
# task1= Task.create(number: 1, complexity: 0)
# task2= Task.create(number: 2, complexity: 1)
# task3= Task.create(number: 3, complexity: 0)
# task4 = Task.create(number: 4, complexity: 1)
# task5 = Task.create(number: 5, complexity: 1)
# task6 = Task.create(number: 6, complexity: 1)
# task7 = Task.create(number: 7, complexity: 1)
# task8 = Task.create(number: 8, complexity: 1)
# task9 = Task.create(number: 9, complexity: 1)
# task10 = Task.create(number: 10, complexity: 1)


# j1= JoinUserAlternativeQuestion.create(order_number: 1, task_id: task1.id, alternative_question_id: aq1.id)
# j2= JoinUserAlternativeQuestion.create(order_number: 2, task_id: task1.id, alternative_question_id: aq2.id)
# j3= JoinUserAlternativeQuestion.create(order_number: 3, task_id: task1.id, alternative_question_id: aq3.id)

# j4= JoinUserAlternativeQuestion.create(order_number: 1, task_id: task3.id, alternative_question_id: aq4.id)
# j5= JoinUserAlternativeQuestion.create(order_number: 2, task_id: task3.id, alternative_question_id: aq5.id)
# j6= JoinUserAlternativeQuestion.create(order_number: 3, task_id: task3.id, alternative_question_id: aq6.id)
# j7= JoinUserAlternativeQuestion.create(order_number: 4, task_id: task3.id, alternative_question_id: aq7.id)

# j1_numerical = JoinUserNumericalQuestion.create(task_id: task2.id, numerical_question_id: numerical_1.id)
# j2_numerical = JoinUserNumericalQuestion.create(task_id: task4.id, numerical_question_id: nume1.id)

# JoinUserNumericalQuestion.create(task_id: task8.id, numerical_question_id: numdf1.id)
# JoinUserNumericalQuestion.create(task_id: task9.id, numerical_question_id: numdf2.id)
# JoinUserNumericalQuestion.create(task_id: task10.id, numerical_question_id: numdf3.id)

u1= User.create(name: "David", last_name: "Diepold", email: "daviddiepold@gmail.com", password: "123456")

u2= User.create(name: "Hola", last_name: "Chao", email: "hc@gmail.com", password: "123456")
teacher = User.create(name: "Profesor", last_name: "Morales", email: "pmorales@admin.cl", password: "123456", role: 1)
