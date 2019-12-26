# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creates Root Admin user
# ADMIN
puts 'Inserting AdminUser...'.colorize(:green)
  admin = User.create name: 'MatriculaWeb Admin', email: 'admin@matriculaweb.gov.br', password: '123123', gov_id: 'SystemAdmin'
  admin.skip_confirmation!
  admin.save
puts '...AdminUser inserted.'.colorize(:light_blue)
# /ADMIN

# ROLES: admin
puts 'Inserting Roles...'.colorize(:green)
  admin_role = Role.first
  admin_role.title = 'Admin do Sistema'
  admin_role.save!

  Role.create name: 'moderator', title: 'Moderador da Secretaria de Educação', description: 'Este usuário tem permissão administrativa sobre os demais, porém não tem função administrativa sobre o sistema.',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'coordinator', title: 'Coordenador de Escola', description: 'Este usuário tem permissão para cadastro de seus alunos e professores',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                          "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'teacher', title: 'Professor de Escola', description: 'Este usuário tem permissão para cadastro de oferta de disciplinas',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                          "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'student', title: 'Estudante/aluno de Escola', description: 'Este usuário só possui permissão para ver e se candidatar às vagas',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                          "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'
puts '...Roles inserted.'.colorize(:light_blue)
# /ROLES

# Creates Sample Users
# USERS
puts 'Inserting SampleUsers...'.colorize(:green)
  coordinator = User.create name: 'Coordenador Exemplo', email: 'coordenador@matriculaweb.gov.br', password: '123123', gov_id: 'SystemCoordinator', role: Role.with_name(:coordinator)
  coordinator.skip_confirmation!
  coordinator.save

  teacher = User.create name: 'Professor Exemplo', email: 'professor@matriculaweb.gov.br', password: '123123', gov_id: 'SystemProfessor', role: Role.with_name(:teacher)
  teacher.skip_confirmation!
  teacher.save

  student = User.create name: 'Aluno Exemplo', email: 'aluno@matriculaweb.gov.br', password: '123123', gov_id: 'SystemStudent', role: Role.with_name(:student)
  student.skip_confirmation!
  student.save
puts '...SampleUsers inserted.'.colorize(:light_blue)
# /USERS