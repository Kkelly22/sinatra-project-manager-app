Specifications for the Sinatra Assessment
Specs:

 x Use Sinatra to build the app - Controllers inherit from Sinatra Base
 x Use ActiveRecord for storing information in a database - Models inherit from Active Record
 x Include more than one model class (list of model class names e.g. User, Post, Category) - Using Project Manager, Client, and Project.
 x Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - Project Manager has many projects, and a Client has many projects. Projects belong to both Project Manager and Client.
 x Include user accounts - Project Manager has a username/password.
 x Ensure that users can't modify content created by other users - Project Manager cannot edit a project if it does not belong to them.
 x Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Project (belongs to Project Manager) can be edited/updated/destroyed/created.
 x Include user input validations - Using BCRYPT for username/password validation.
 x Display validation failures to user with error message (example form URL e.g. /posts/new) - Using RACKFLASH to show success/failure messages.
 x Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

 x You have a large number of small Git commits
 x Your commit messages are meaningful
 x You made the changes in a commit that relate to the commit message
 x You don't include changes in a commit that aren't related to the commit message

 **I got in the zone and forgot to commit frequently at the start of this project.  I am adding a client class and doing smaller commits to help remedy this.
