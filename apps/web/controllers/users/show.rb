module Web::Controllers::Users
  class Show
    include Web::Action

    expose :user, :projects

    def call(params)

    end
  end
end