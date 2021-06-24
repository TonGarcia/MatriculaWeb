# 1. Install WSL
https://aka.ms/wslstore

# 2. Update apt-get
```shell script
    sudo apt-get update && sudo apt-get upgrade -y
```

# 3. Install Dependencies (Rails + MySQL)
```shell script
    sudo apt-get install openssh-server libxml2 libxml2-dev libxslt1-dev libmysqlclient-dev nodejs libqt4-dev libqtwebkit-dev -y
    # update node
    sudo npm cache clean -f
    sudo npm install -g n
    sudo n stable
    npm i -g yarn
```

# 3.1. Install Postgresql
```shell
    sudo apt-get update && sudo apt-get install postgresql postgresql-contrib libpq-dev
    service postgresql start
    sudo -u postgres createuser -s pguser
    sudo -u postgres psql
    > \password pguser
    # TIRAR O WARNING
    nano /etc/postgresql/10/main/postgresql.conf
    # ctrl + w -> fsync 
    fsync = off
    data_sync_retry = true
    # /fsync
    service postgresql restart
```

# 4. Install RVM
 ```shell script
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash  
```

# 5. Install Ruby
```shell script
    rvm install 2.6.5 
```

# 6. Install Dependencies
```shell script
    # rvm use 2.6.5@leads
    cd /mnt/c/Projects/rails/LeadsHunters/
    gem install bundler
    bundle
    yarn
```

# 7. MySQL startup
```shell script
    service mysql status
    service mysql start
    service mysql stop
```

# 8. Rails Start - Ruby Setting
```shell script
    rails s
```

# IF NODE V8 ERROR
nodejs ≠ node
nodejs -v = v8
node -v = v14
remove it command nodejs, it is not supported anymore:
```shell script
    apt-get purge nodejs
```

# Find RVM Location
```shell script
    $ which rvm 
```

# RubyMine
1. Open RubyMine on the project
1. File > Settings > Languages & Frameworks > Ruby SDK and Gems > + > New remote
1. WSL > Ubuntu & paste location got running (which rvm) --> select it project gemset
