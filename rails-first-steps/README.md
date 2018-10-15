Rails First Steps
=================

We're going to introduce Ruby on Rails by building a very simple Rails app. We're going to leave TDD to one side – just for a moment – while we take a look Rails and what it provides for us.

Getting set up
--------------

First you need to make sure you've got Rails installed.

    $ gem install rails

This should head off to the internet and download Rails and all of its dependent gems.

We now want to create our first Rails app. Rails provides us with a command that creates a new project from scratch. We're going to create a really simple Todo application.

    $ rails new todo

You should see a whole bunch of output as Rails does its thing and generates your new project. If you now type `ls` you should see that rails has created a new `todo/` directory for you. `cd` into this directory and take a look around.

Record here what the following folders are for:

* `app` - 
* `bin` - 
* `config` - 
* `db` - 
* `lib` - 
* `log` - 
* `public` - 
* `test` - 
* `tmp` - 
* `vendor` - 

Make a commit of your application at this point so that you can see what changes.

    $ git add -A
    $ git commit -m "Hello, rails"

Let's get started building our application. We're going to make use of the Rails generators to pull something quickly together then we'll take a look at what its done for us.

Scaffolding
-----------

Rails includes a _scaffold_ generator. This will generate a lot of the major pieces of code we need for an application. Many experienced Rails developers don't use the scaffold generator at all, but it will help us quickly see the pieces that make up a rails application.

    $ bin/rails generate scaffold List name:string description:string

Take a look at all the files that files that Rails has just generated for you:

    $ git status

As you can see there's a lot of files added and changed! Let's try starting the Rails server and see what its done for us from the outside.

First, before we can run our server, we need to run the generated _migration_. A key part of Rails is how it manages your web application's database for you. A migration is a description of how to manipulate the tables in a database written in Ruby. Take a look at the migration in `db/migrate/`. What do you think it's going to do?

Now let's run the migration:

    $ bin/rails db:migrate

With the migration run, we can finally start our Rails server.

    $ bin/rails server

This will start a web server for you. By default, Rails server will run on port 3000. If you visit http://localhost:3000/ you should see your Rails app up and running!

"Yay! You're on Rails!"

This is just the standard Rails root! To see what we generated visit http://localhost:3000/lists

What do you see here? What can you do? What happens to the data if you stop the server (`<ctrl-c>`) and restart it?

What just happened?
-------------------

Describe in your own words the following major parts of Rails.

* Routes
* Controller
* Model
* View

Rails console
-------------

Rails includes a REPL, like `irb`.

    $ bin/rails console

Have a play with the `List` model. Try these, what do they do?

    > List.count
    > List.first
    > List.order(:name).first(2)

Extending the application?
--------------------------

Make sure you've committed all your changes.

    $ git add -A
    $ git commit -m "Add List scaffold"

Now that we can create new lists, they'll be much more useful if we can add items to the list. Let's do that now, going a little bit slower so we can examine each piece as we go.

We'll use the Rails generator, but just build one piece at a time. 

    $ bin/rails generate model item description:string list:references

First of all take a look at the migration that's been generated. What's happening here? What's different from the last migration? Don't forget to run the migration.

    $ bin/rails db:migrate

If you look at `app/models/item.rb` you should see that the generated file looks like this:

```ruby
class Item < ApplicationRecord
  belongs_to :list
end
```

What do you think the `belongs_to` line is doing?

To complete the other side of this we need to edit the `app/models/list.rb` class to look like this:

```ruby
class List < ApplicationRecord
  has_many :items
end
```

We now want to use this _collection_ of items in our view. Edit `app/views/lists/show.html.erb`, and add the following after the description paragraph and before the "Edit" and "Back" links.

```erb
<ul>
  <%= render @list.items %>
</ul>
<%= form_for([@list, @list.items.build]) do |f| %>
 <%= f.text_field :description, placeholder: "I must remember to..." %>
 <%= f.submit %>
<% end %>
```

If you run the server now and visit http://localhost:3000/lists/1 you should see a `NoMethodError`. What do you think this means?

To fix the error we are going to add some new routes to app. Make `config/routes.rb` look like this:

```ruby
Rails.application.routes.draw do
  resources :lists do
    resources :items
  end
end
```

You can examine the new routing table like this

    $ bin/rails routes

If you reload the page now you should see our form to add a new list item. What happens if you try to add a new item?

This error is caused because Rails is expecting there to be an `ItemsController` to handle our requests relating to items.

We can generate that too:

    $ bin/rails generate controller Items

If you try again to add a new item you should see a new error. Now Rails is complaining that there is no `create` action (or method) or the `ItemsController`. Edit `app/controllers/items_controller.rb` so it looks like this:

```ruby
class ItemsController < ApplicationController
  before_action :set_list

  def create
    @item = @list.items.create(item_params)
    redirect_to @list
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:description)
  end
end
```

Again try adding an item to you list. What happens this time? Do you get an error? What page / url are you on? What output do you see in the server logs?

This next error is telling us that we need to add a _partial_ `items/_item`. Create the file `app/views/items/_item.html.erb` and add this line to it

```erb
<li><%= item.description %></li>
```

Save the file and reload your browser.

Hopefully you are now able to create lists, edit their name and description and add items.

Next steps
----------

* What happens if you try to delete a list that contains items? Can you fix this?
* New features
  * Complete an item
  * _Uncomplete_ an item
  * Remove an item
  * Change the order of items in the list
