reconnecting-women-vets
=======================

#How it should look when we are done:
![reconnecting home](https://github.com/seanperkins/reconnecting-women-vets/raw/master/mock_ups/reconnecting-women-veterans-01.jpg)
![reconnecting get-started](https://github.com/seanperkins/reconnecting-women-vets/raw/master/mock_ups/reconnecting-women-veterans-02.jpg)
![reconnecting questions](https://github.com/seanperkins/reconnecting-women-vets/raw/master/mock_ups/reconnecting-women-veterans-03.jpg)

#Initial Setup of New Rails App on AWS using capistrano

## Create New EC2 Instance
* **Launch** a ubuntu 12.10 instance
* Allocate an **Elastic IP** address
* Login and run `sudo apt-get update && sudo apt-get dist-upgrade`
* Install dependencies we will need later like:
    * git for use with capistrano `sudo apt-get install git`
    * mysql for RDS `sudo apt-get install mysql-client libmysqlclient-dev`
    * Curl if needed `sudo apt-get install curl libcurl3 libcurl3-dev`
    * Install nodejs `sudo apt-get install nodejs`
    * Install RVM `\curl -L https://get.rvm.io | bash -s stable --rails`
    ** source `~/.rvm/scripts/rvm`

## Create new RDS Instance
* Create a new mysql instance
* Configure **DB Security Groups** to allow traffic from EC2 Instance
* Configure EC2 **Security Groups** to allow MYSQL port 3306 from your RDS

## Setup Passenger and ngynx
* If using ruby2.0.0-p0 use `rvmsudo gem install passenger --pre`
* Install nginx with passenger support `rvmsudo passenger-install-nginx-module`
* Download init script and throw it in init.d
  * `wget -O init-deb.sh http://library.linode.com/assets/660-init-deb.sh`
  * `sudo mv init-deb.sh /etc/init.d/nginx`
  * `sudo chmod +x /etc/init.d/nginx`
  * `sudo /usr/sbin/update-rc.d -f nginx defaults`

## Deploy using capistrano
* Create capfile and deploy.rb
    * Main Points to remember:
    * `role :db` should be the same as your application, not your RDS
* `cap deploy:setup`
    * You may have file permission problems after running this, if you do `sudo chown ubuntu:ubuntu <the folder>`
* `cap deploy:check`
* From production server `ssh git@github.com` to add host key
* `cap deploy`
* If you get an error then ssh into server and do bundle install
* Ensure you are using the same ruby version locally as the server