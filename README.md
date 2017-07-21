Problem Records When Learning Ruby on Rails
==========================
##### Ruby on Rails 5 Essential Training: https://www.lynda.com/Ruby-Rails-tutorials/Ruby-Rails-5-Essential-Training/500551-2.html

##### Notice: Record every problem when i learned ruby on rails. I hope my experience can help you to learn ruby on rails better.

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

#### (5) Server request handling
##### (a) Build folder named "demo" in public folder and add a file named "static_page.html"
	web server first looks for a matching file on the public folder.
	in browser, input "localhost:3000/demo/static_page.html" can visit this page

#### (6) Routes
##### (a) How to set default route?
	get ':controller(/:action(/:id))'
##### (b) How to set default route?
	root 'demo#index', tells which controller and action should rout to.

### 2. Controllers, Views, and Dynamic Content
#### (1) Render a template
##### (a) How to use render to override the default route
	In app/controllers/demo_controller.rb, use:
	def index
		render('hello')
	end
	so when you visit /demo/index, you will view the template of "hello.html.erb".
	render(:template => 'demo/hello')

#### (2) Redirect actions
##### (a) How to redirect to other pages?
	It need the combination of config/routes.rb and apps/controllers/demo_controller.rb.
	in routes.rb:
		def other_hello
			redirect_to(:action => 'hello')
		end
	in demo_controller.rb
		get 'demo/other_hello'
	the routes parse the address of browser and get other_hello string and send it to controller to handle it.

#### (3) Instance variable
##### (a) How to use instance variable.
	In demo_controller.rb, define an instance variable like this followed by @,
	def hello
    	@array = [1,2,3,4,5]
    	render('hello')
  	end
  	In hello.html.erb, we can use this array like:
  	<% @array.each do |n|>

#### (4) Link
##### (a) How to create a link
	the link in ruby on rails like this: <%= link_to(text, target) %>
	<%= link_to("one link", {:action => 'index'}) %>

#### (5) URL parameters
##### (a) How to use parameters in URL?
	aa) In index.html.erb, construct a url link with parameters:
	<%= link_to('Hello with parameters', {:action => 'hello', :page => 5, :id => 20}) %><br />
	bb) In demo_controller.rb, fetch the parameters in url:
	@id = params[:id]
	@page = params[:page]
	these instance variables can be used in templates
	cc) In hello.html.erb, display this paramters:
	ID: <%= @id %>
	ID: <%= params[:id] %>

### 3. Datebase and migration
#### (1) Generate migrations
##### (a) the line to generate a migration.
	rails generate migration DoNothingYet

#### (2) Generate models
##### (a) How to generate a model and add column in table.
	aa) rails generate model User,
		get an xxx_create_users.rb in db/migrate
	bb) t.column "first_name", :string, :limit => 25
##### (b) The relationship between database and rails
	database = application
	table = model
	column = attribute of model

#### (3) Run migration
##### (a) Run "rails db:migrate" fail and get error.
	Forget to start mysql server.

##### (b) Basic operation of mysql.
	aa) rails -u rails_user -p simple_cms_development
	bb) SHOW TABLES;
	cc) SHOW FIELDS FROM users;

##### (c) How to down/up the migration
	down: rails db:migrate VERSION=0;
	use 'rails db:migrate:status' to find the version you want to up;
	up: rails db:migrate VERSION=...;
	schema file will keep track the version

### 3. Models and ActiveRecord
#### （1）Mdoel naming
##### (a) what is the relationship between files, classes and tables.
	These names should be sync, for example:
	file name: admin_user.rb
	classe name: class AdminUser < ApplicationRecord
	table name: admin_users

#### (2) The Rails console
##### (a) How to use rails console.
	Use 'rails console' to access rails console.
	Then we can use activerecord of the table, eg:
	subject = Subject.new
	subject.name = 'test'

#### (3) Create record
##### (a) difference between new and create.
	aa) subject = Subject.new(:name => "First Subject", position: 1, visible: true, created_at: nil, updated_at: nil)
	it does not save automatically
	bb) subject = Subject.create(:name => "Second Subject", :position => 2)
	it save the record automatically

#### (4) Update record 
##### (a) two ways of updating record
	aa) subject = Subject.find(1)
		subject.name = "Initial Subject"
		subject.save
	it does not save automatically
	bb) subject = Subject.find(2)
		subject.update_attributes(:name => "Next Subject", :visible => true)
	it save the record automatically

#### (5) Delete record
##### (a) How to delete a record
	subject = Subject.find(3)
	subject.destroy
	This record will be deleted from database