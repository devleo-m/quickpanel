namespace :db do
  desc "Create default roles"
  task create_roles: :environment do
    roles = ["admin", "escritor", "leitor"]
    roles.each do |role|
      Role.find_or_create_by(name: role)
    end
  end
end
