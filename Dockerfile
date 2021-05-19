#base image for ruby
FROM ruby:2.6.3
#install and upgrade dependencies
RUN apt update -qq && \
    apt install -y build-essential 
#Create App folder
RUN mkdir /app
#Select directory as current path
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
#install ruby project
RUN bundle install -j 10
#Copy all application to image
COPY . /app
#Expose the internal port used by the application
EXPOSE 3000
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]