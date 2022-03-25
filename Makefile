build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

up:
	docker-compose up -d

down:
	docker-compose down

restart: down up

install-dependencies:
	docker-compose exec back composer install
	docker-compose exec front yarn install

install-laravel:
	docker-compose down
	sudo rm -rf back
	mkdir back
	docker-compose up -d
	docker-compose exec back composer create-project laravel/laravel .
	sudo rm back/.env
	cp .env.example.back back/.env
	docker-compose exec back php artisan key:generate --ansi

install-nuxt:
	sudo rm -rf front
	docker-compose run front yarn create nuxt-app .
	docker-compose down
	docker-compose up -d

migrate:
	docker-compose exec back php artisan migrate

run-laravel:
	docker-compose exec -d back php artisan serve --host=0.0.0.0 --port=8080


install: build up install-dependencies migrate run-laravel