module Web::Authentication
  def self.included(action)
    action.class_eval do
      before :check_sinatra
      before :authenticate!
      expose :current_user
      expose :sinatra
    end
  end

  private

  def authenticate!
    redirect_to routes.new_session_path unless authenticated?
  end

  def authenticated?
    !!current_user
  end

  def current_user
    @current_user ||= UserRepository.new.find(session[:user_id])
  end

  def check_sinatra
    begin
      response = HTTParty.get(ENV['SINATRA_URL'])
      @sinatra = true
    rescue StandardError => e
      Hanami.logger.error e.message
      @sinatra = false
    end
  end
end