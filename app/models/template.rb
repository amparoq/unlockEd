class Template < ApplicationRecord
    enum difficulty: {
        high: 2,
        medium: 1,
        low: 0
    }

    SHARED_VARIABLES = {
    volumen_L: -> { rand(1..10) },
    temperatura_K: -> { rand(273..373) },
    temperatura_C: -> { rand(0..100) },
    temp_hielo: -> { rand(265..273) },
    temp_vapor: -> { rand(373..403) },
    temp_hielo_C: -> { rand(-8..0) },
    temp_vapor_C: -> { rand(100..120) },
    temperatura_inicial: -> { rand(273..300) },
    masa_g: -> { rand(10..500) },
    masa_kg: -> { rand(0.1..2.0) },
    masa_hielo: -> { rand(20..100) },
    masa_vapor: -> { rand(5..200) },
    moles: -> { rand(1..5) },
    presion_atm: -> { rand(1..8) },
    molar: -> { rand(27.0..98.0) },
    capacidad_calorifica: -> { rand(0.0..6.0) },
    masa_calorimetro: -> { rand(300..1000) },
    delta_h: -> { rand(10..100) },
    procentaje: -> { rand(0..100) },
    fraccion: -> { rand(0..1) },
    n: -> { rand(1..4)}
    }

    def self.generate_question(question)
        temp_inicial = 0
        pregunta_generada = question.gsub(/\{\{(.*?)\}\}/) do |match|
          variable = match[2..-3].strip
          variable_valor = SHARED_VARIABLES[variable.to_sym]
          if variable == "temperatura_inicial"
            temp_inicial = variable_valor
          end
          if variable == "temperatura_final" 
            variable_valor = temp_inicial + rand(5..30)
          end
          variable_valor&.call || match
        end
    
        return pregunta_generada
    end
end