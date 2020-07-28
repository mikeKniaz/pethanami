module Web::Controllers::Users
  class Create
    include Web::Action

    expose :user

    params do
      required(:user).schema do
        required(:name).filled(:str?)
        required(:position).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        @user = UserRepository.new.create(params[:user])

        redirect_to '/users'
      else
        self.status = 422
      end
    end
  end
end