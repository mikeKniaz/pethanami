class ProjectRepository < Hanami::Repository
  associations do
    belongs_to :user, as: :pm
    has_many :users, through: :project_devs, as: :devs
  end
end
