class UserTaskController < ApplicationController
    def update_state_skip
        task = Task.find(params[:task_id])
        ut = UserTask.find_by(task_id: task.id)
        ut.status = 1
        ut.save
        respond_to do |format|
            format.js {render inline: "location.reload();" }
        end
    end
end