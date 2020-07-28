module Web::Controllers::Projects
  class Update
    include Web::Action

    expose :project

    params do
      required(:project).schema do
        required(:dev_ids).filled(:array?)
        required(:user_id).filled(:int?)
      end
    end

    def call(params)
      if params.valid?
        ProjectDevRepository.new.by_project(params[:id]).delete
        params[:project][:dev_ids].each do |dev_id|
          ProjectDevRepository.new.create(project_id: params[:id], user_id: dev_id)
        end

        ProjectRepository.new.update(params[:id], user_id: params[:project][:user_id])

        redirect_to '/projects'
      else
        self.status = 422
      end
    end
  end
end