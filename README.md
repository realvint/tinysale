# Tinysale clone

## Software versions:
* Ruby 3.2.2
* Rails 7.0.7
* PostgreSQL 14.6
* Redis
* Node JS 16
* Yarn 1.22

## Start project
1. Set up local environment (Ruby, etc.)
2. Download or clone a repository
3. Run bundler and yarn to install required gems and dependencies

```bash
$ bundle install
$ yarn
```
4. Create `.env` file by example `.env.example`
```bash
$ cp .env.example .env
```
If necessary, you can run PostgreSQL and Redis locally using [Docker](https://docker.com)

Make sure you are using [Docker Compose V2](https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command)
```
% docker compose version
Docker Compose version v2.3.3
```

`docker-compose.yml` configured to run PostgreSQL and Redis
```bash
$ docker compose up -d
```
5. Create and set up a database for the project
```bash
$ rails db:prepare
```
6. Start project
```bash
$ bin/dev
```

### The project is available at the link http://localhost:3000/
