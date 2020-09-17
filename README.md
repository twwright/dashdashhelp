# [dashdashhelp](http://github.com/twwright/dashdashhelp)

### __dashdashhelp__ is a web app for asking and answering questions while working through online course curricum. It was designed as a portfolio project at the Flatiron School. __dashdashhelp__ is written in Ruby on Rails, using thoughtbot's Clearance gem, ActiveStorage, Boostrap, and Github omniauth.

## Running dashdashhelp

### Prerequisites
Other than the gems listed in this app's Gemfile, you will need to have [Ruby](https://www.ruby-lang.org/en/downloads/) and [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html) installed on your local machine as well as the ability to install Ruby gems.

### Using Gitpod
If you are interested in jumping into the code without forking and cloning locally, the simplest way to access the code for development is to use [![this Gitpod.io link](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/twwright/dashdashhelp). At launch, Gitpod will install yarn, rails, run migrations, and then attempt to run the rails server. You will be prompted with an error; follow the error instructions to update line 28 of the `config/environments/development.rb` file with the new `config.hosts` address. You can then kill the server with Ctrl+C and re-run `rails s` to start the server correctly. *(Please note: You will not be able to use omniauth from Gitpod.)*

### Using localhost
If you want to work on your local environment, you can start by forking and cloning this GitHub repo to your local machine, using the terminal. 

``` 
git@github.com:twwright/dashdashhelp.git
```

After changing directories into the repo, run a bundler to install dependencies then run migrations:
```
$ cd dashdashhelp
$ bundle install
$ rails db:migrate
```

Run `$ rails s` to start a web server, then use your favorite browser to visit the route displayed in the terminal (e.g. http://localhost:3000).

### Built With
- Ruby on Rails
- [Clearance](http://github.com/thoughtbot/clearance)
- SQLite3
- ActiveStorage
- Github Omniauth

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/twwright/dashdashhelp. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://github.com/twwright/dashdashhelp/code_of_conduct.md) code of conduct.

Looking for a specific way to contribute? 
Check out the `Issues` section with TODOs, bugs to fix, and planned features.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details