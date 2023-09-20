class HomeController < ApplicationController

    def index
        @pending_tasks = Task.where(status: 0)
        @completed_or_skipped_tasks = Task.where(status: [1, 2])

        @colors= ["#ff5757", "#ffd357", "#95ff57", "#84feed", "#6f69fe", "#b969fe"]
      end

end