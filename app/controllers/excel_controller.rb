class ExcelController < ApplicationController
    def main
        xlsx_vc = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'tablaVC_mine.xlsx'))
        xlsx_vc.default_sheet = xlsx_vc.sheets[1]

        xlsx_sc = Roo::Excelx.new(Rails.root.join('app', 'assets', 'tables', 'sobreCalentado.xlsx'))

        headers_sc = xlsx_sc.row(2)

        headers = xlsx_vc.row(2)
        @data = []
        @data2 = []


        3.upto(xlsx_vc.last_row) do |row_num|
            info_all = Hash[headers.zip(xlsx_vc.row(row_num))]
            if info_all["Variable"] == "V"
                row = Hash[["tsat (°C)", "liq.sat."].zip(xlsx_vc.row(row_num))]
                @data << row
            end
        end

        @data2.each do |d2|
            if d2["P (kPa)"] == 1 && d2["Variable"] == "V"
                @volumen = d2[75]
            end
        end                                                             
    end
end