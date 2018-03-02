# sinatra-project-manager-app
Sinatra MVC App for Project Managers

This is a MVC Sinatra Application for which a Project Manager can create
an account and keep track of Projects they are managing.  
-A Project Manager has a Name, Title, Username and Password.
-A Project has a Project Number, Name, Delivery Date, Budget Remaining, and Status.
-A Client has a Name.
-A project belongs to both a Project Manager and a Client.
-Only the Project Manager can edit Projects belonging to them.

A Project Manager has many Projects
A Client has many Projects
A Project Belongs to a Project Manager and a Client

To use, run the following in order:
1) "bundle install"
2) "rake db:migrate"
3) shotgun to start the server
