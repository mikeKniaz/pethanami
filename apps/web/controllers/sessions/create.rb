module Web::Controllers::Sessions
  class Create
    include Web::Action

    def call(_)
      user = UserRepository.new.find_by_name(requested_name)

      if !user.nil? && password_correct?(user)
        session[:user_id] = user.id
        redirect_to routes.root_path
      else
        redirect_to routes.new_session_path
      end
    end

    private

    def password_correct?(user)
      user.password == requested_password
    end

    def requested_name
      params[:session][:name]
    end

    def requested_password
      params[:session][:password]
    end

    def authenticate!; end
  end
end