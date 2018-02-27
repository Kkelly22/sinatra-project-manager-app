# sinatra-project-manager-app
Sinatra MVC App for Project Managers

This is a MVC Sinatra Application for which a Project Manager can create
an account and keep track of Projects they are managing.  
-A given Project Manager has a Name and Title.
-A given Project has a Project Description, Priority, and Budget.
-Only the Project Manager can edit Projects belonging to them.

A Project Manager has many Projects
A Project Belongs to a Project Manager

To use, run the following in order:
1) "bundle install"
2) "rake db:migrate"
3) shotgun to start the server
