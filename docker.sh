docker build -t rails docker/rails
docker build -t pg docker/pg
#sudo docker rm -f rails; sudo docker rm -f pg
sudo docker run -d -p 127.0.0.1:80:80 --name rails -v .:/var/www:ro rails
sudo docker run -d -p 127.0.0.1:5432:5432 --name pg pg