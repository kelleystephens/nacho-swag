# User Stories

____
## Features
* User signs up through Eventful
* User signs in through Eventful
* User signs out
* User adds contact information
* User views their dashboard
* User adds an item for rent
* User searches for items
* User views an available item
* User views an unavailable item
* User rents an item

____
## Stories

____
### User signs up through Eventful
> As a user, I want to sign up using Eventful in order to avoid setting up with
> an email & password

* #### Usage:
  * On homepage, click "Sign Up with Eventful"
  * User sees their dashboard


* #### Acceptance Criteria:
  * User is redirected to authorize app
  * User is saved to database with:
    * Name
    * Location

### User signs in through Eventful
> As a user, I want to sign in using Eventful in order to avoid remembering
> an email & password

* #### Usage:
  * On homepage, click "Sign In with Eventful"
  * User sees their dashboard


* #### Acceptance Criteria:
  * User is redirected to authorize app
  * User is logged in

### User signs out
> As a user, I want to sign out in order to leave the app

* #### Usage:
  * On any page, click "Sign Out"
  * User sees homepage


* #### Acceptance Criteria:
  * User is logged out

### User adds contact information
> As a user, I want to add contact info in order to rent items

* #### Usage:
  * On dashboard, click "Add Contact Information"
  * User selects preferred method of contact
  * User enters contact info
  * User clicks "Submit"
  * User sees dashboard with no "Add Contact" link


* #### Acceptance Criteria:
  * User is logged in
  * All inputs must be filled in
  * "Add Contact Info" is not visible if info has been entered

### User views their dashboard
> As a user, I want to view my dashboard in order to see all my rentals

* #### Usage:
  * On any page, user clicks "Dashboard"
  * User sees their dashboard


* #### Acceptance Criteria:
  * User must be logged in
  * User sees their own dashboard

### User adds an item for rent
> As a user, I want to add an item in order to rent it out

* #### Usage:
  * On dashboard, user clicks "Add an Item"
  * User fills in "name", "price", "location" & "description"
  * User uploads a photo
  * User clicks "Add item"
  * User sees their dashboard with new item listed


* #### Acceptance Criteria:
  * User must be logged in
  * User must fill in all inputs

### User searches for items
> As a user, I want to search in order to find items I want to rent

* #### Usage:
  * From search page, user selects a location
  * User selects a category
  * User clicks "Search"
  * User sees all applicable items


* #### Acceptance Criteria:
  * User must be logged in
  * User must select a location
  * User must select a category

### User views an available item
> As a user, I want to view an item in order to find out more information

* #### Usage:
  * User clicks on desired item
  * User sees item view page


* #### Acceptance Criteria:
  * User must be logged in
  * View page must contain photo, "name", "price", "location", & description
  * View page must have a button to rent the item

### User views an unavailable item
> As a user, I want to view an item in order to find out more information

* #### Usage:
  * User clicks on desired item
  * User sees item view page


* #### Acceptance Criteria:
  * User must be logged in
  * View page must contain photo, "name", "price", "location", & description
  * View page must have a notification that item is currently rented

### User rents an item
> As a user, I want to rent an item in order to use it

* #### Usage:
  * From the item view page, user clicks "Rent"
  * User sees dashboard with rented item listed


* #### Acceptance Criteria:
  * User must be logged in
  * User must have contact information in profile
