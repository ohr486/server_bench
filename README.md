# server_bench

## rails implement

### setup for dev
```
rake db:create
rake db:migrate
rake db:seed
rails s
curl http://localhost:3000/ping
curl http://localhost:3000/api/group/1/members
```

## elixir implement

### setup for dev
```
mix deps.get
mix deps.compile
mix compile
iex -S mix
curl http://localhost:4000/ping
curl http://localhost:4000/api/group/1/members
```
