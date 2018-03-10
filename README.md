# README

This is a simple web app that resembles the "Things to Do" section on TripAdvisor. It covers over 200 popular tourist attractions across 9 cities in the United States.

[Heroku deployment address]()
Administrator account:
* Username: "admin"
* Password: "iamtheboss"

As a user, you may:
* See how many attractions of each category there are at a certain destination, and apply category filters to see only the type(s) of attractions you are most interested in.
* Search all attraction names with a keyword.
* Check out the basic information of an attraction, including an interactive Google map, and the average of ratings (out of 5) that have been left for the attraction.
* Read the comments left by other users, and leave a review on an attraction (rating+comment).
* View, edit or delete your own reviews.
* Add or remove an attraction from your wish list. View your wish list of attractions.
* Create new account, update your password, or delete your current account.

A user with administrator privileges, he or she may also:
* Add a new attraction, view list of all attractions, and edit or delete existing attraction.
* View list of all destinations, add a new destination, and edit existing attraction. (Cannot delete destination.)
* View list of all categories, and add a new category. (Cannot edit or delete category.)
* View list of all users.

Models:
* 6 Models: User, Destination, Attraction, Category, Wish, Review
* Fully RESTful resources: Attractions, Reviews (although it depends on user authorizations.)
* Many model validation measures in place, such as the confirmation of email and password when signing up.

Security:
* Default CSRF countermeasure: protect_from_forgery with: :exception
* SQL injection countermeasure for search function: use sanitized keyword.
* User authentication: use one-way password encryption with bcrypt.
* User authorizations:
  * Regular users cannot enjoy administrator privileges by simply changing URLs.
  * Users cannot modify reviews/wish lists of other users by simply changing URLs.
