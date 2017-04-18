FROM ruby:2.4
MAINTAINER Koji Shimba <me@shimba.co>

RUN apt-get update && apt-get install -y \
    libpq-dev \
    build-essential \
    nodejs \
    qt5-default \
    wget\
    python2.7-dev \
    vim

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD ./Gemfile* $APP_HOME/
RUN bundle install

COPY . $APP_HOME/

CMD sh $APP_HOME/bin/init.sh
