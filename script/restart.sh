#!/bin/bash
###################
# Author:  wudi
# Mail: programmerwudi@gmail.com 
# Description: 
# Created Time: 2018-03-20 18:44:40
###################

echo "look pid"
ps aux |grep unicorn

echo "git pull start..."
git pull 

echo "bundle installing"
bundle install

echo "assets"
RAILS_ENV=production bundle exec rails assets:precompile rails assets:precompile

kill -9 `cat /opt/work/marvelous/tmp/pids/marvelous_peach.pid` ;  bundle exec unicorn_rails -E production -D -c /opt/work/marvelous/config/unicorn.rb; ps aux |grep unicorn


#god stop simple
#echo "restart god"
#god -c simple.god 


echo "Restart end.."
