class UserRepository < Hanami::Repository
  associations do
    has_many :projects, as: :pm
    has_many :projects, through: :project_devs, as: :works
  end

  def find_by_name(name)
    users.where(name: name).as(User).one
  end

  def pms
    users.where(position: 'pm')
  end

  def devs
    users.where { position.not('pm') }
  end

  def selected_devs(project_id)
    dev_ids = ProjectDevRepository.new.by_project(project_id).select(:user_id).map { |d| d[:user_id] }
    users.where(id: dev_ids)
  end
end
