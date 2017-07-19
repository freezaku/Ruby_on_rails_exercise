Record problems I meet when learning ruby on rails
==========================
### 1. Get Started

#### (1) Create a project
##### (a) Use "brew install sql" to install sql
##### (b) Initialize ruby on rails project: rails new simple_cms -d mysql.
	name is simple_cms, use mysql database

#### (2) Configure a project
##### (a) Input "mysql -u root -p" and the password of my mbp doestn't word.
	Use "mysql.server start" to start the server of mysql;
	The default password of the root is blank, just type "Enter" will be OK.
##### (b) Alter the database to other user.
	Use "GRANT ALL PRIVILEGES ON simple_cms_test.* TO 'rails_user'@'localhost' IDENTIFIED BY 'secretpassword';";
	simple_cms_test is the name of database, rails_user is the name of user,
	localhost is the server of the user, secretpassword is the password of this database
##### (c) After changing the username and password in database.yml, using "rails db:schema:dump" to connect to the data base and dump to the text, get "rails aborted! Mysql2::Error: Access denied for user 'rails_user'@'localhost' ..."

	Made mistake when setting the password in database.yml file, set the password as "secretspassword", the password set in the mysql is "secretpassword". Foolish mistake.

#### (3) Access a Project
##### (a) How to start and stop server.
	Start: rails s
	Stop: control + c

#### (4) Generate a controller and view
##### (a) What does "rails generate controller demo index" do.
	Create a controller named 'demo' with an action named 'index'(the name of views).
	'demo' is the folder name, 'index' is view template name.
	Use "localhost:3000/demo/index" can check this view in the controller
