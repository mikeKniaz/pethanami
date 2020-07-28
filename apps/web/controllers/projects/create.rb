module Web::Controllers::Projects
  class Create
    include Web::Action

    expose :project

    params do
      required(:project).schema do
        required(:name).filled(:str?)
        required(:user_id).filled(:int?)
      end
    end

    def call(params)
      if params.valid?
        @book = ProjectRepository.new.create(params[:project])

        redirect_to '/projects'
      else
        self.status = 422
      end
    end
  end
end