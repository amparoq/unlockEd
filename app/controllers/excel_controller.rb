class ExcelController < ApplicationController
    def main
        xlsx_prop_agua_sat = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'Propiedades_Agua_saturada.xlsx'))

        @headers_agua = xlsx_prop_agua_sat.row(1)
        @headers_agua = @headers_agua.slice!(2,(@headers_agua.length-3))
        
        
    end
end