require 'rom/sql/extensions/postgres'

class UpsertProject < ROM::SQL::Commands::Postgres::Upsert
  relation :projects
  register_as :upsert_project
  conflict_target :name
  result :one
end
