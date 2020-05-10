git clone https://github.com/loshakigor/reddit.git
source /home/loshakigor/.rvm/scripts/rvm
cd reddit && bundle install
puma -d
