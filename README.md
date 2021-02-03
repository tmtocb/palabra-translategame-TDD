## Palabra app - learn words and translation in different languages.

---

![](palabragame.png)
![](palabranew.png)
![](palabralist.png)

---

## Stack

* <img alt="Ruby" src="https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white"/> as language.
* <img alt="Rails" src="https://img.shields.io/badge/rails%20-%23CC0000.svg?&style=for-the-badge&logo=ruby-on-rails&logoColor=white"/> as framework.
* <img alt="Postgres" src ="https://img.shields.io/badge/postgres-%23316192.svg?&style=for-the-badge&logo=postgresql&logoColor=white"/> as database.
* <img alt="Heroku" src="https://img.shields.io/badge/heroku%20-%23430098.svg?&style=for-the-badge&logo=heroku&logoColor=white"/> for continuous-deployment in production (with always forced SSL connection)
* <img alt="TravisCI" src="https://img.shields.io/badge/travisci%20-%232B2F33.svg?&style=for-the-badge&logo=travis&logoColor=white"/> for continuous-integration
* <img alt="Bootstrap" src="https://img.shields.io/badge/bootstrap%20-%23563D7C.svg?&style=for-the-badge&logo=bootstrap&logoColor=white"/> as CSS framework.
* <img alt="Sass" src="https://img.shields.io/badge/SASS%20-hotpink.svg?&style=for-the-badge&logo=SASS&logoColor=white"/><img alt="HTML5" src="https://img.shields.io/badge/html5%20-%23E34F26.svg?&style=for-the-badge&logo=html5&logoColor=white"/><img alt="CSS3" src="https://img.shields.io/badge/css3%20-%231572B6.svg?&style=for-the-badge&logo=css3&logoColor=white"/> for Front-End styling.
* <img alt="JavaScript" src="https://img.shields.io/badge/javascript%20-%23323330.svg?&style=for-the-badge&logo=javascript&logoColor=%23F7DF1E"/><img alt="jQuery" src="https://img.shields.io/badge/jquery%20-%230769AD.svg?&style=for-the-badge&logo=jquery&logoColor=white"/> for scripts, nested forms and styling.
* <img alt="Git" src="https://img.shields.io/badge/git%20-%23F05033.svg?&style=for-the-badge&logo=git&logoColor=white"/><img alt="GitHub" src="https://img.shields.io/badge/github%20-%23121011.svg?&style=for-the-badge&logo=github&logoColor=white"/> for version control, in this project I have learned branching, pull requests and merging. 
* <img alt="Webpack" src="https://img.shields.io/badge/webpack%20-%238DD6F9.svg?&style=for-the-badge&logo=webpack&logoColor=black" /> for styling and scripts as I moved from Rails asset pipeline.
* **RSpec, FactoryBot, Shoulda-Matchers, Guard-RSpec** as test suite stack.
* gem **language_list** for external Language API list used in database.
* gem **devise** for authentication.
* gem **pundit** for authorization.
* gem **rubocop** for static-code-analysis
* gem **brakeman** for security vulnerability checks.
* gem **bundler-audit** for Bundler security verification
* gem **kaminari** for pagination.
* gem **bullet** in development for killing n+1 queries.
* gem **pry** for debugging.
* Rails debbuger in development.
* gem **faker** for seed sample data.
* gem **nested_forms** for nested Javascript forms.
* gem **simple_form** for clean forms.
* Google Fonts
* **Font-Awesome** as an icon toolkit.
* responsive layout meta tag for mobiles.
* HTML5 shim for pre-9 Internet Explorer browsers.

---

## Configuration & dependencies

### System dependencies

`Ruby: 2.7.2p137`

`Rails: 6.0.3.4`


`database: postgresql`

### Configuration

`git clone https://github.com/tmtocb/palabra-translator-TDD`

`bundle install`


### Database

`rails db:drop db:create db:migrate`

`rails db:seed` to seed database with faker data

### Run the app

`rails s`

`foreman start`

### Development tools

`binding.pry` to debug

`rubocop` for static-code-analysis

`brakeman` for security vulnerability checks.

`bundler-audit` for Bundler security verification

via browser with Rails debugger 

### Run tests

`rspec` to run full test suite

`guard` for autotests live in development