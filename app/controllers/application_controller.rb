class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_global_variables

    def set_global_variables
        @themes = ["Tablas de saturación", "Entalpía", "Calor Latente", "Diagrama de fases", "Calidad de mezclas"]
    end
end
