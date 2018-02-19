# README

*Please refer to the "Milestone" section for a description of the current stage (Feb. 19)*
*Only three attractions in Chicago are initiated from seed.rb.*

### Scope of Project
This will eventually become a website where visitors can figure out attractions of interest for a particular destination.
It mimics a simple version of "Things to Do" on TripAdvisor.
The initial state of the final product will include around 300 attractions located in 9 popular U.S. cities, but the destinations/attractions can be easily expanded.

Users will be able to:
* Pick a destination to check out its introduction and attractions.
* Filter attractions by their types.
* Check out basic information of a particular attraction.
* View ratings and comments from other users.
* Rate and comment on attractions.
* View all ratings and comments previously posted by him/herself.
* Add attractions to/remove attractions from his/her travel wish list.
    * Many-to-many relationship between Attraction and User.

Adminstrators will be able to:
* Add/Delete/Edit destinations, attractions, and attraction types.
* Delete "harmful" reviews and users.

### RESTful
**For administrators:**
* Destination, Attraction, and Type are **completely** RESTful.
* Read/Delete User and Review.

**For users:**
* Read all reviews. OWN reviews are **completely** RESTful.

### Milestone
* Purely "proof of concept", no consideration of UX yet.
* Only three attractions in Chicago are initiated from seed.rb.
* Requirements met:
    * Completed domain model.
	* Completed model validations.
	* Attraction is completely RESTful already (will be limited to administrators).
* Review and Wishlist features have not been developed yet.