FROM ubuntu:14.04
ENV REFRESHED_AT 2014-16-10 20:20

RUN apt-get update
RUN apt-get install -y curl nano nodejs build-essential
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.0"
RUN /bin/bash -l -c "rvm --default use 2.1.0"
RUN /bin/bash -l -c "gem install rails --no-ri --no-rdoc"
RUN apt-get install -y postgresql-client libpq-dev

COPY Gemfile /var/www/Gemfile
COPY Gemfile.lock /var/www/Gemfile.lock
WORKDIR /var/www
RUN ["/bin/bash", "-l", "-c", "bundle install"]
EXPOSE 80
ADD . /var/www
CMD ["/bin/bash", "-l", "-c", "rails s -p 80"]

#RUN apt-get install -y apache2
#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2
#run rm -R /var/www/*


#ENTRYPOINT ["/usr/sbin/apache2"]
#CMD ["-D", "FOREGROUND"]
#ENTRYPOINT ["rails s -p 80"]