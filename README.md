# RSPEC - CLIENTE CADASTRO  
Aplicação utilizando as boas práticas do Rails no quesito TDD

### RSPEC

```
  rails g rspec:install
```

Para rodar os testes mais rápido é ótimo utilizar a gem:

```
  gem 'spring-commands-rspec'
```
Após instalar gerar os binstubs

```
  bundle exec spring binstub rspec
```

Configurar os generators no config/application.rb

```ruby
config.generators do |generator|
  generator.test_framework :rspec,
    fixtures: false,
    view_specs: false,
    view_specs: false,
    helper_specs: false,
    routing_specs: false
end

```
Para rodar o teste mais rápido, basta utilizar o comando abaixo.

```
 docker-compose run --rm web bin/rspec
```

Gerar feature

```
 docker-compose run --rm web rails g rspec:feature welcome
``` 