# Bookshelf Hanami app using rom-rb standalone

This is the bookshelf hanami application based on [the official Getting Started guide](https://guides.hanamirb.org/introduction/getting-started/) with the following tweaks:

- hanami-model was replaced with a standalone rom-rb setup
- entities are under `Bookshelf::Entities` namespace
- repositories are under `Bookshelf::Repositories` namespace
- repository instances can be accessed through a convenient `Bookshelf::Repositories.[EntityName]` shortcut
- `DELETE /books/:id` was also implemented

## rom-rb setup

The entire rom-rb configuration is handled by `config/initializers/rom.rb` which defines `Bookshelf::Persistence` module which exposes the following global methods:

- `Bookshelf::Persistence.db` returns a configured `ROM::Container`
- `Bookshelf::Persistence.relations` relation registry (mostly useful in tests)
- `Bookshelf::Persistence.configuration` return `ROM::Configuration` that can be useful in rake tasks or scripts that need db connection *without the whole `ROM::Container`*

You can tweak this initializer if you need to access more databases, need extra plugins to be enabled etc.

## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec rake db:migrate

% HANAMI_ENV=test bundle exec rake db:migrate
```

## Learn more about Hanami

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.3.1/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
