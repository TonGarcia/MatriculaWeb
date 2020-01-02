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
  School.create name: 'Secretaria de Educação', code: '001'
  Insertions::School.instance.load_and_persist(show_progress=true, pagination=10) #, pagination=350000
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

  student = User.create full_name: 'Aluno Exemplo', email: 'aluno@matriculaweb.gov.br', password: '123123', gov_id: '644837', school_id: 1, role: Role.with_name(:student)
  student.skip_confirmation!
  student.save
puts '...SampleUsers inserted.'.colorize(:light_blue)
# /USERS

# Creates Knowledge Areas
# KNOWLEDGE AREAS
puts 'Inserting KnowledgeAreas...'.colorize(:green)
  # Super KnowledgeArea
  fgb = KnowledgeArea.create name: 'Formação Geral Básica'
  it_fom = KnowledgeArea.create name: 'Itinerários Formativos'

  # KnowledgeArea
  KnowledgeArea.create name: 'Linguagens e suas Tecnologias', knowledge_area_id: fgb.id
  KnowledgeArea.create name: 'Matemática e suas Tecnologias', knowledge_area_id: fgb.id
  KnowledgeArea.create name: 'Ciências da Natureza e suas Tecnologias', knowledge_area_id: fgb.id
  KnowledgeArea.create name: 'Ciências Humanas e Sociais Aplicadas', knowledge_area_id: fgb.id

  # Structural Axes (Eixos Estruturantes)
  KnowledgeArea.create name: 'Investigação Científica', knowledge_area_id: it_fom.id
  KnowledgeArea.create name: 'Processos Criativos', knowledge_area_id: it_fom.id
  KnowledgeArea.create name: 'Empreendedorismo', knowledge_area_id: it_fom.id
  KnowledgeArea.create name: 'Mediação e Intervenção Sociocultural', knowledge_area_id: it_fom.id

  # Sub KnowledgeArea
  KnowledgeArea.create name: 'Projeto de Vida', knowledge_area_id: it_fom.id, description: 'O projeto de vida é visto como uma estratégia pedagógica cuja intenção é proporcionar o autoconhecimento do estudante e sua dimensão cidadã, de modo a orientar o planejamento da carreira almejada com base em seus interesses, talentos, desejos e potencialidades. Assim, as unidades escolares devem desenvolver ações curriculares que apoiem o desenvolvimento do projeto de vida dos estudantes, as quais ampliem o universo dos estudantes e a percepção desses sobre a vida, discorrendo sobre as possibilidades de escolha presentes em seu itinerário formativo e nas diversas dimensões da vida'
  KnowledgeArea.create name: 'Eletivas Orientada', knowledge_area_id: it_fom.id, description: 'As Eletivas Orientadas são unidades curriculares de duração semestral, com carga horária definida conforme a intencionalidade pedagógica, nas quais os estudantes serão matriculados de acordo com suas escolhas, porém de maneira orientada.'
  KnowledgeArea.create name: 'Trilhas', knowledge_area_id: it_fom.id, description: 'As Trilhas de Aprendizagem são compostas por uma sequência de quatro unidades curriculares e possuem a duração total de quatro semestres, que irão possibilitar o aprofundamento progressivo das aprendizagens em uma área do conhecimento e/ou na Formação Profissional e Técnica.'
puts '...KnowledgeAreas inserted.'.colorize(:light_blue)
# /KNOWLEDGE AREAS
