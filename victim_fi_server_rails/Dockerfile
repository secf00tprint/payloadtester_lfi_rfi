FROM ruby:2.6.3

LABEL maintainer="secf00tprint@gmail.com"

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /myapp
WORKDIR /myapp

COPY myapp/Gemfile /myapp
RUN cd /myapp \
    && bundle install \
    && bundle exec rails new . --force --skip-bundle \
    && rails generate controller fileinclusion

# copy route
COPY myapp/config/routes.rb /myapp/config/
# copy controller 
COPY myapp/app/controllers/fileinclusion_controller.rb /myapp/app/controllers/ 
EXPOSE 3000
CMD /bin/bash -c 'cd /myapp/ && rails --version && rails server -b 0.0.0.0 ' 
