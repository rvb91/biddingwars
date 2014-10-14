# READ ME

### Raghav Bagla (raghav.bagla@gmail.com)


### **Ruby Version and gemset :**  ruby-2.0.0-p353
### Database: Sqlite
### Rails 4.1.1

##Setup Instructions

This is a standard Rails 4 app. All testing and development was done in development mode. To get the app running please follow the steps given below. 

Assuming bundler, rvm already installed

	cd /path/to/folder/containing/code
	bundle install
	bundle exec rake db:reset 
	bundle exec rake db:migrate
	bundle exec rails s
	
A development server will be started at **localhost:3000** 


### A Note on Broken Conventions
The models also contain a number of elements that break Rails Convention such as using custom defined field of userId instead of user_id. This was intentional by design to learn more about custom directives for defining the primary key. This will probably be reverted back in a future update. 

Angular is also kept in the /public directory instead of inside the Rails app. An intentional choice to keep Rails as just the API and angular as the frontend.


## Assumptions Made

The following assumptions were made to limt the scope of the code.

* when **no one makes a valid bid** before auction closes on an item, the **currentPrice is set to 0 **and the **bestBidderId is set to 0**. 

* A **user does not ownItem** (win the bid) **till the auction finishes**. That is - snapshot will not show that they own the item even if they are the current highest bidder. 

* When a user is added to the system, the parameter **userId will be unique**. That is - no 2 users can have the same userId. The **budget and userId** will also be **greater than 0**. 

* An item can have a bidding **startPrice between 1 to 999999** (inclusive)

* A **bid** on an item can be **between 1 to 1 Million** (inclusive). A users **budget** can be **maximum of 1 Million** 

* A **userId associated** with an **item** will be a **valid user**. That is the user will be added before the item is added by that user.

* A **user** who the item belongs to **cannot bid on his own item**. Will return "insufficient funds"

* **2 or more users** trying to bid at exactly the **same time on the same item** will be an **exception not the norm**. This is assumed because no where does the user come to know when the bid will end. So sniping like on eBay should not come into play. 

* 2 or more users trying to bid at exactly the same time (on different items) will not happen often. Basically low write concurrency. (assumed because of limitation of sqlite to only 1 writer at a time. This can be easily mitigated by moving to a full database)

