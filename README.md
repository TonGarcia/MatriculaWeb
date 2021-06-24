# MatriculaWeb
MatriculaWeb - Sec Edu DF


# Scaffolds:

1. School:
    ```shellscript
      $ rails g scaffold School name:string code:string administrative_type:string total_rooms:integer used_rooms:integer amount_employees:integer user:belongs_to
    ```
1. KnowledgeAreas
    ```shell script
      $ rails g scaffold KnowledgeArea name:string knowledge_area:belongs_to
    ```
1. Subject (workload = total time of it subject):
    ```shell script
      $ rails g scaffold Subject name:string description:string workload:integer online_link:string class_schedule:string user:belongs_to knowledge_area:belongs_to
    ```
1. Subscription:
    ```shell script
      $ rails g scaffold Subscription access_type:string user:belongs_to subject:belongs_to 
    ```


Clear Database: ``` $ rails d scaffold School && rails d scaffold Subject && rails d scaffold Subscription ```
*Remember to update add_school_ref_to_user migration timestamp

# SSL
Localhost HTTPS para testes como o do facebook: https://rossta.net/blog/local-ssl-for-rails-5.html#resolve-a-domain-name-to-localhost
--> O SSL QUE FUNCIONOU FOI O DO HEROKU: https://devcenter.heroku.com/articles/ssl-certificate-self
--> O tutorial do SSL do heroku está no dropbox

Trust SSL: sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain config/ssl/server.crt

Executando rails com SSL: rails s -b 'ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt'

puma -b 'ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt'

RUBY MINE CONFIG: __Server Arguments__ = -b "ssl://0.0.0.0:3000?key=config/ssl/server.key&cert=config/ssl/server.crt"

--> IF locahost takes so long, it is HTTP not HTTPS, CHECK IT

# RubyMine

## SSL RubyMine
Add ao Server Arguments: -b "ssl://localhost:3000?key=config/ssl/server.key&cert=config/ssl/server.crt"

## Docker Debug RubyMine
README-wsl-rubymine.md

# PostGreSQL

1. Install
    ```shell
      sudo apt update
      sudo apt install postgresql postgresql-contrib
    ```
1. LogIn
    ```shell
      sudo -i -u postgres
    ```

# Ubuntu Services (Databases)

1. Status Check
   ```shell
      service --status-all
   ```
1. Start MySQL
   ```shell
      service mysql start
   ```
1. Start Postgres
   ```shell
      service postgresql start
   ```
1. [Setup AWS S3](https://devcenter.heroku.com/articles/s3)

1. ActiveStorage Upload files: /config/storage.yml

# Postgres MAC

1. Install: ``` brew doctor && brew update && brew install postgresql postgres ```
1. Start: ``` brew services start postgresql ```
1. Access postgres and alter:
   1. Access: ``` psql postgres ```
   1. Inside database:
      1. ``` CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres'; ```
      1. ``` ALTER ROLE postgres CREATEDB; ```
      1. ``` ALTER USER postgres CREATEDB; ```
      1. exit ``` \q ```
      1. ``` CREATE ROLE pguser WITH LOGIN PASSWORD 'pguser'; ```
      1. ``` ALTER ROLE pguser CREATEDB; ```
      1. ``` ALTER USER pguser CREATEDB; ```
      1. ``` GRANT ALL PRIVILEGES ON DATABASE schema_migrations to pguser; ```
      1. exit ``` \q ```

# Cron Whenever
1. install the gem
1. write your scheduler.rb file
1. push to the remote server
1. login to the remote server (for example with ssh)
1. see if whenever is good uploaded by running in terminal: whenever
1. update whenever crontab by running:  whenever --update-crontab --set environment=development
1. restart the server crontab (for example in Ubuntu server): sudo service cron restart
1. check if crontab is good implemented on the server: crontab -l
