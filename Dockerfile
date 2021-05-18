FROM ruby:2.6.3

ENV VIPS_VERSION="8.9.2"

RUN apt update -qq && \
    apt install -y build-essential libpq-dev nodejs netcat phantomjs 

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install -j 10

COPY . /app

EXPOSE 3000
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]