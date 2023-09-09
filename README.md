Inicio:

bundle add cssbundling-rails &&
rails css:install:bootstrap &&
yarn build:css &&
yarn add @hotwired/turbo-rails &&
yarn add @hotwired/stimulus &&
yarn build

Si te patalea yarn build por esbuild: bundle add jsbundling-rails ./bin/rails javascript:install:esbuild


Modelos:

Las clases son:

1- User:
a) name: string
b) last_name: string
c) email: string
d) password: string
e) user_level: float
f) streak: int
g) module: int

2- Alternative_Question:
a) difficulty: string
b) module: int
c) question: string
d) alternative_a: string
e) alternative_b: string
f) alternative_c: string
g) alternative_a_answer: string
h) alternative_b_answer: string
i) alternative_c_answer: string
j) correct_alternative: string

3- Numerical_Question:
a) difficulty: string
b) module: int
c) question: string
d) answer: string
e) hint: string
f) domain: string
g) alter_domain: bool

4- Task:
a) user_id: User
b) number: int
c) status: int

5- Join_User_Alternative_Question:
a) user_id: User
b) task_id: Task
c) alternative_question_id: Alternative_Question
d) attempts: int
e) order_number: int

6- Join_User_Numerical_Question:
a) user_id: User
b) task_id: Task
c) numerical_question_id: Numerical_Question
d) attempts: int
e) order_number: int

One user has many tasks
Many tasks have many alternative questions
Many tasks have many numerical questions


Comandos:

rails g migration createUser name:string last_name:string user_level:float streak:integer module:integer

rails g migration createAlternativeQuestion difficulty:integer module:integer question:string alternative_a:string alternative_b:string alternative_c:string alternative_a_answer:string alternative_b_answer:string alternative_c_answer:string correct_alternative:string

rails g migration createNumericalQuestion difficulty:integer module:integer question:string answer:string hint:string domain:string alter_domain:boolean

rails g migration createTask number:integer status:integer

rails g migration createJoinUserAlternativeQuestion attempts:integer order_number:integer

rails g migration createJoinUserNumericalQuestion attempts:integer order_number:integer

rails g migration addUserReffToTask user:references

rails g migration addUserReffToJoinUserAlternativeQuestion user:references

rails g migration addTaskReffToJoinUserAlternativeQuestion task:references

rails g migration addAlternativeQuestionReffToJoinUserAlternativeQuestion alternative_question:references

rails g migration addUserReffToJoinUserNumericalQuestion user:references

rails g migration addTaskReffToJoinUserNumericalQuestion task:references

rails g migration addAlternativeQuestionReffToJoinUserNumericalQuestion alternative_question:references

bundle install

rails generate devise:install

rails generate devise User



TO DO sabado 9 de sept:

-Hacer un modelo template para poder calcular respuestas de las numerical questions segun el template (if numerical_question.id que sea if template id)

-Realizar la primera tarea numerica (casi igual que lo de alternativas)