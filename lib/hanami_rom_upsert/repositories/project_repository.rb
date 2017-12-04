class ProjectRepository < Hanami::Repository
  def upsert(data)
    upsert_command = command(:upsert_project, projects, use: %i[timestamps])
    upsert_command = upsert_command.with_opts(update_statement: { updated_at: Time.now })
    self.class.entity.new(upsert_command.call(data))
  rescue => e
    raise Hanami::Model::Error.for(e)
  end
end
