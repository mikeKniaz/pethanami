class ProjectDevRepository < Hanami::Repository
  associations do
    belongs_to :user
    belongs_to :project
  end

  def by_project(project_id)
    project_devs.where(project_id: project_id)
  end
end
