
# README
This is a sample Ruby on Rails application containing the minimum requirements to run.

Build Docker container

	docker build -t demo-app_web .

Run Docker container

    docker run -d -p 80:3000 demo-app_web


you can also use docker compose tu build and run the application with

    docker-compose up
