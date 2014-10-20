#sudo echo "127.0.0.1 webapp.dev" >> /etc/hosts
ln webapp/Gemfile .docker/rails/Gemfile
ln webapp/Gemfile.lock .docker/rails/Gemfile.lock
docker build -t rails .docker/rails
docker build -t pg .docker/pg
rm .docker/rails/Gemfile .docker/rails/Gemfile.lock
docker rm -f rails; docker rm -f pg
docker run -d -p 127.0.0.1:5432:5432 --name pg pg
docker run -d --net="host" -v ~/Github/simplecases/webapp:/var/www/webapp:ro --name rails rails
#docker run -d -p 127.0.0.1:80:80 --name rails rails
#-v $PWD/webapp:/var/www:ro rails
#sudo docker run --name rails -i -t rails /bin/bash