<<<<<<< HEAD
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ROLES: admin
puts 'Inserting Roles...'.colorize(:green)
  admin_role = Role.first
  admin_role.title = 'Administrador do Sistema'
  admin_role.save!

  Role.create name: 'moderator', title: 'Moderador da Secretaria de Educação', description: 'Este usuário tem permissão administrativa sobre os demais, porém não tem função administrativa sobre o sistema.',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                              "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'coordinator', title: 'Coordenador de Instituição', description: 'Este usuário tem permissão para cadastro de seus alunos e professores',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'teacher', title: 'Professor de Instituição', description: 'Este usuário tem permissão para cadastro de oferta de disciplinas',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'student', title: 'Estudante/Aluno de Instituição', description: 'Este usuário só possui permissão para ver e se candidatar às vagas',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'
puts '...Roles inserted.'.colorize(:light_blue)
# /ROLES

# Creates Root Admin user
# ADMIN
puts 'Inserting AdminUser...'.colorize(:green)
  admin = User.create full_name: 'MatriculaWeb Admin', email: 'admin@matriculaweb.gov.br', password: '123123', gov_id: '000001'
  admin.skip_confirmation!
  admin.save
puts '...AdminUser inserted.'.colorize(:light_blue)
# /ADMIN

# Creates Sample Schools
# SCHOOLS
puts 'Inserting SampleSchools...'.colorize(:green)
  # School.create name: 'Secretaria de Educação', code: '001'
  # Insertions::School.instance.load_and_persist(show_progress=true, pagination=100) #, pagination=350000
  School.create name: 'SENAR', code: '04.279.967/0001-05', total_rooms: 5, used_rooms: 3, amount_employees: 100
  School.create name: 'ESALQ', code: '63.025.530/0001-04', total_rooms: 5, used_rooms: 3, amount_employees: 100
  School.create name: 'CONAB', code: '26.461.699/0001-80', total_rooms: 5, used_rooms: 3, amount_employees: 100
puts '...SampleSchools inserted.'.colorize(:light_blue)
# /SCHOOLS

# Creates Sample Users
# USERS
puts 'Inserting SampleUsers...'.colorize(:green)
  coordinator = User.create full_name: 'Coordenador Exemplo', email: 'coordenador@matriculaweb.gov.br', password: '123123', gov_id: '032142', school_id: 1, role: Role.with_name(:coordinator)
  coordinator.skip_confirmation!
  coordinator.save

  teacher = User.create full_name: 'Professor Exemplo', email: 'professor@matriculaweb.gov.br', password: '123123', gov_id: '3147362', school_id: 1, role: Role.with_name(:teacher)
  teacher.skip_confirmation!
  teacher.save

  student = User.create full_name: 'Aluno João', email: 'aluno1@matriculaweb.gov.br', password: '123123', gov_id: '644837', school_id: 1, role: Role.with_name(:student)
  student.skip_confirmation!
  student.save

  student = User.create full_name: 'Aluno Raphel', email: 'aluno2@matriculaweb.gov.br', password: '123123', gov_id: '644837', school_id: 1, role: Role.with_name(:student)
  student.skip_confirmation!
  student.save
puts '...SampleUsers inserted.'.colorize(:light_blue)
# /USERS

# Creates Knowledge Areas
# KNOWLEDGE AREAS
puts 'Inserting KnowledgeAreas...'.colorize(:green)
  # Super KnowledgeArea
  fgb = KnowledgeArea.create name: 'Formação Geral Básica'
  fte = KnowledgeArea.create name: 'Formação Técnica Especializada'

  # KnowledgeArea
  pp = KnowledgeArea.create name: 'Políticas Públicas', knowledge_area_id: fgb.id
  afc = KnowledgeArea.create name: 'Acesso a Fomento (Crédito)', knowledge_area_id: fgb.id

  # Structural Axes (Eixos Estruturantes)
  pg = KnowledgeArea.create name: 'Plantações de Grãos', knowledge_area_id: fte.id
  ph = KnowledgeArea.create name: 'Plantações de Hortifruti', knowledge_area_id: fte.id
puts '...KnowledgeAreas inserted.'.colorize(:light_blue)
# /KNOWLEDGE AREAS


# Creates Subjects
# SUBJECTS
puts 'Inserting Subjects...'.colorize(:green)
  Subject.create name: 'Acesso a financiamento da agricultura familiar', description: 'Aprenda a conseguir os melhores financiamentos com as menores taxas', workload: 10, class_schedule: '00000110000001000000000000000000000000000000000000000000000000000', online_link: 'https://www.youtube.com/watch?v=CTBWcXkNoMM', knowledge_area_id: afc.id, user_id: 1
  Subject.create name: 'Produção de mudas de tomate', description: 'Como criar mudas de tomate de baixo custo e como vendê-las', workload: 10, class_schedule: '00000110000001000000000000000000000000000000000000000000000000000', online_link: 'https://www.youtube.com/watch?v=lA1ItxM9yIE', knowledge_area_id: ph.id, user_id: 1
puts '...KnowledgeAreas inserted.'.colorize(:light_blue)
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ROLES: admin
puts 'Inserting Roles...'.colorize(:green)
  admin_role = Role.first
  admin_role.title = 'Administrador do Sistema'
  admin_role.save!

  Role.create name: 'moderator', title: 'Moderador da Secretaria de Educação', description: 'Este usuário tem permissão administrativa sobre os demais, porém não tem função administrativa sobre o sistema.',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                              "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'coordinator', title: 'Coordenador de Instituição', description: 'Este usuário tem permissão para cadastro de seus alunos e professores',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'teacher', title: 'Professor de Instituição', description: 'Este usuário tem permissão para cadastro de oferta de disciplinas',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'

  Role.create name: 'student', title: 'Estudante/Aluno de Instituição', description: 'Este usuário só possui permissão para ver e se candidatar às vagas',
              the_role: '{"system":{"administrator":false},"admin_roles":{"index":false},
                            "researchers":{"index":true, "show":true,"new":true,"create":true,"edit":true,"update":true}}'
puts '...Roles inserted.'.colorize(:light_blue)
# /ROLES

# Creates Root Admin user
# ADMIN
puts 'Inserting AdminUser...'.colorize(:green)
  admin = User.create full_name: 'MatriculaWeb Admin', email: 'admin@matriculaweb.gov.br', password: '123123', gov_id: '000001'
  admin.skip_confirmation!
  admin.save
puts '...AdminUser inserted.'.colorize(:light_blue)
# /ADMIN

# Creates Sample Schools
# SCHOOLS
puts 'Inserting SampleSchools...'.colorize(:green)
  # School.create name: 'Secretaria de Educação', code: '001'
  # Insertions::School.instance.load_and_persist(show_progress=true, pagination=100) #, pagination=350000
  School.create name: 'SENAR', code: '04.279.967/0001-05', total_rooms: 5, used_rooms: 3, amount_employees: 100
  School.create name: 'ESALQ', code: '63.025.530/0001-04', total_rooms: 5, used_rooms: 3, amount_employees: 100
  School.create name: 'CONAB', code: '26.461.699/0001-80', total_rooms: 5, used_rooms: 3, amount_employees: 100
puts '...SampleSchools inserted.'.colorize(:light_blue)
# /SCHOOLS

# Creates Sample Users
# USERS
puts 'Inserting SampleUsers...'.colorize(:green)
  coordinator = User.create full_name: 'Coordenador Exemplo', email: 'coordenador@matriculaweb.gov.br', password: '123123', gov_id: '032142', school_id: 1, role: Role.with_name(:coordinator)
  coordinator.skip_confirmation!
  coordinator.save

  teacher = User.create full_name: 'Professor Exemplo', email: 'professor@matriculaweb.gov.br', password: '123123', gov_id: '3147362', school_id: 1, role: Role.with_name(:teacher)
  teacher.skip_confirmation!
  teacher.save

  student = User.create full_name: 'Aluno João', email: 'aluno1@matriculaweb.gov.br', password: '123123', gov_id: '644837', school_id: 1, role: Role.with_name(:student)
  student.skip_confirmation!
  student.save

  student = User.create full_name: 'Aluno Raphel', email: 'aluno2@matriculaweb.gov.br', password: '123123', gov_id: '644837', school_id: 1, role: Role.with_name(:student)
  student.skip_confirmation!
  student.save
puts '...SampleUsers inserted.'.colorize(:light_blue)
# /USERS

# Creates Knowledge Areas
# KNOWLEDGE AREAS
puts 'Inserting KnowledgeAreas...'.colorize(:green)
  # Super KnowledgeArea
  fgb = KnowledgeArea.create name: 'Formação Geral Básica'
  fte = KnowledgeArea.create name: 'Formação Técnica Especializada'

  # KnowledgeArea
  pp = KnowledgeArea.create name: 'Políticas Públicas', knowledge_area_id: fgb.id
  afc = KnowledgeArea.create name: 'Acesso a Fomento (Crédito)', knowledge_area_id: fgb.id

  # Structural Axes (Eixos Estruturantes)
  pg = KnowledgeArea.create name: 'Plantações de Grãos', knowledge_area_id: fte.id
  ph = KnowledgeArea.create name: 'Plantações de Hortifruti', knowledge_area_id: fte.id
puts '...KnowledgeAreas inserted.'.colorize(:light_blue)
# /KNOWLEDGE AREAS


# Creates Subjects
# SUBJECTS
puts 'Inserting Subjects...'.colorize(:green)
  Subject.create name: 'Acesso a financiamento da agricultura familiar', description: 'Aprenda a conseguir os melhores financiamentos com as menores taxas', workload: 10, class_schedule: '00000110000001000000000000000000000000000000000000000000000000000', online_link: 'https://www.youtube.com/watch?v=CTBWcXkNoMM', knowledge_area_id: afc.id, user_id: 1
  Subject.create name: 'Produção de mudas de tomate', description: 'Como criar mudas de tomate de baixo custo e como vendê-las', workload: 10, class_schedule: '00000110000001000000000000000000000000000000000000000000000000000', online_link: 'https://www.youtube.com/watch?v=lA1ItxM9yIE', knowledge_area_id: ph.id, user_id: 1
puts '...KnowledgeAreas inserted.'.colorize(:light_blue)
>>>>>>> 34166a1067dc45e0339bcbf35c4f8978d91dd5f3
# /KNOWLEDGE AREAS