class NumericalQuestion < ApplicationRecord
    has_many :join_user_numerical_questions
    has_many :user_question_values

    enum difficulty: {
        high: 2,
        medium: 1,
        low: 0
    }

    def self.generate_info
        xlsx_vc = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'tablaVC_mine.xlsx'))
        xlsx_vc.default_sheet = xlsx_vc.sheets[1]

        xlsx_prop_agua_sat = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'Propiedades_Agua_saturada.xlsx'))

        xlsx_134 = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'H134A_tsat.xlsx'))

        headers = xlsx_vc.row(2)
        @data = []

        headers_agua = xlsx_prop_agua_sat.row(1)

        headers_134 = xlsx_134.row(1)
        @data_134 = []

        3.upto(xlsx_vc.last_row) do |row_num|
            row = Hash[headers.zip(xlsx_vc.row(row_num))]
            @data << row
        end

        2.upto(xlsx_134.last_row) do |row_num|
            row = Hash[headers_134.zip(xlsx_134.row(row_num))]
            @data_134 << row
        end

        @presion_refrigerante = Set.new
        @data_134.each do |d134|
            @presion_refrigerante.add(d134["P (kPa)"])
        end
        presion_134 = @presion_refrigerante.to_a

        @temp_sat_set = Set.new
        @presion_first = {}
        @data.each do |d|
            if !@presion_first[d["tsat (°C)"]].present?
                @presion_first[d["tsat (°C)"]] = d["P (kPa)"]
            end
            @temp_sat_set.add(d["tsat (°C)"])
        end
        temp_sat = @temp_sat_set.to_a
        presion_sat = @presion_first
        @headers_agua = xlsx_prop_agua_sat.row(1)
        temp_a_sat = @headers_agua.slice!(2,(@headers_agua.length-3))

        return temp_sat, presion_sat, temp_a_sat, presion_134
    end

    def self.generate_question(question)
        temp_sat, presion_sat, temp_a_sat, presion_134 = generate_info
        temp_inicial = 0
        temp_C_vap = nil
        generated_question = {}
        shared_variables = {
            n: -> { rand(2..20) },
            volumen_L: -> { rand(20..90) },
            presion_134a: -> { presion_134.sample },
            t_agua_sat: -> { temp_a_sat.sample },
            temperatura_C_vap: -> { temp_sat.sample },
            masa_kg: -> { rand(40..60) },
            masa_g: -> { rand(20..800) },
            temp_hielo: -> { rand(-50..0) },
            temp_agua: -> { rand(1..100) },
            temp_vapor: -> { rand(100..300) },
            Q: -> { rand(100.0..500.0) },
            masa_kg_men: -> { rand(20..generated_question["masa_kg"] - 10) },
            volumen_tanque: -> { (rand(1.0..3.0)).round(2) },
            temperatura_vapor: -> { rand(100..300) },
            t1: -> { rand(293.0..473.0).round(2) },
            p1:-> { rand(20..200) },
            p2:-> { rand(10..(generated_question["p1"]-10))},
            v1:-> { rand(0.01..0.1).round(2) },
            v2:-> { rand((generated_question["v1"] + 0.1)..0.2).round(2) }
        }
        
        pregunta_generada = question.gsub(/\{\{(.*?)\}\}/) do |match|
            variable = match[2..-3].strip
            variable_valor = shared_variables[variable.to_sym]
            
            if variable == "temperatura_C_vap" && !temp_C_vap.present?
                temp_C_vap = variable_valor&.call
                if !generated_question[variable]
                    generated_question[variable] = temp_C_vap
                end
            end
            
            if variable == "presion_saturacion"
                variable_valor = presion_sat[temp_C_vap]
                generated_question[variable] = variable_valor
            end

            if !generated_question[variable] && !variable_valor.is_a?(Integer) && !variable_valor.is_a?(Float)
                generated_question[variable] = variable_valor&.call
            end
                        
            generated_question[variable] || match
            
        end
        generated_question["pregunta"] = pregunta_generada
        return generated_question
    end

end