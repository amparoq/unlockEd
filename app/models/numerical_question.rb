class NumericalQuestion < ApplicationRecord
    has_many :join_user_numerical_questions
    has_many :user_question_values

    enum difficulty: {
        high: 2,
        medium: 1,
        low: 0
    }

    PRESION_SAT = {
      "80" => 47.412,
      "81" => 49.364,
      "82" => 51.384,
      "83" => 53.473,
      "84" => 55.633,
      "85" => 57.865,
      "86" => 60.171,
      "87" => 62.554,
      "88" => 65.015,
      "89" => 67.556,
      "90" => 70.18,
      "91" => 72.888,
      "92" => 75.683,
      "93" => 78.566,
      "94" => 81.541,
      "95" => 84.608,
      "96" => 87.77,
      "97" => 91.03,
      "98" => 94.39,
      "99" => 97.852,
      "100" => 101.419
    }

    SHARED_VARIABLES = {
    temperatura_C_vap: -> { rand(80..100) },
    masa_kg: -> { rand(40..60) },
    volumen_tanque: -> { (rand(1.0..3.0)).round(2) },
    temperatura_vapor: -> { rand(100..300) }
    }

    def self.generate_question(question)
        temp_inicial = 0
        temp_C_vap = nil
        generated_question = {}
        
        pregunta_generada = question.gsub(/\{\{(.*?)\}\}/) do |match|
            variable = match[2..-3].strip
            variable_valor = SHARED_VARIABLES[variable.to_sym]
            
            if variable == "temperatura_C_vap" && !temp_C_vap.present?
                temp_C_vap = variable_valor&.call
                if !generated_question[variable]
                    generated_question[variable] = temp_C_vap
                end
            end
            
            if variable == "presion_saturacion"
                variable_valor = PRESION_SAT[temp_C_vap.to_s]
                generated_question[variable] = variable_valor
            end

            if !generated_question[variable] && !variable_valor.is_a?(Integer) && !variable_valor.is_a?(Float)
                generated_question[variable] = variable_valor&.call
            end
            
            
            # if variable == "temperatura_inicial"
            # temp_inicial = variable_valor
            # generated_question[variable] = temp_inicial
            # end
            
            # if variable == "temperatura_final"
            # variable_valor = temp_inicial + rand(5..30)
            # generated_question[variable] = variable_valor
            # end
            
            generated_question[variable] || match
            
        end
        generated_question["pregunta"] = pregunta_generada
        return generated_question
    end

end