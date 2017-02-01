FROM ruby:2.3.1

RUN apt-get update -qq
RUN apt-get install -y build-essential nodejs npm nodejs-legacy mysql-client

RUN mkdir /myapp

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /myapp
WORKDIR /myapp

CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]