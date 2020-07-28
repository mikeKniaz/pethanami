module Web::Controllers::Projects
  class New
    include Web::Action

    expose :pms

    def call(params)
      @pms = UserRepository.new.pms
    end
  end
end