module Web::Controllers::Projects
  class Edit
    include Web::Action

    expose :project, :pms, :devs, :selected_devs

    def call(params)
      @project = ProjectRepository.new.find(params[:id])
      @pms = UserRepository.new.pms
      @devs = UserRepository.new.devs
      @selected_devs = UserRepository.new.selected_devs(params[:id])
    end
  end
end