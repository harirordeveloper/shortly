# README

Main Functionality of the Application

* shorten the long URL's given by user with 5 random alpha-numeric characters.

* when the user loads the shorted URL it will redirect him back to the original URL he used to generate short URL.

* We have the analytics of user clicks of Shortened URL's

		When the user is getting redirected we are capturing his IP address from request object, and using that IP address we are getting his location details from Google.

				* For this we have used geocoder gem to get the details based on IP.
				* From the geocoding details we are capturing country, regeion, city, Postal code and saving in our DB, under analytics table.

* Added feature specs ( Integration specs) using cucumber, capybara and Rspec.
	One can run the feature specs as follow

	$ cucumber cucumber features/

	This will run all the feature specs by opening a chrome browser instance.


*  Added Controller specs using Rspec.
  One can run these specs as follow

  $ rspec spec/controllers


Running project in development mode is easy

1. clone the project using

	git clone https://github.com/harirordeveloper/shortly.git

2. bundle install

3. rake db:create

4. rake db:migrate

5. rails server

This will run the project locally on localhost:3000



Scalability Issues:

As the application keep growing there may be few issues that we may encounter.

1. As we are tracking analytics based on user IP and using Geocoder to fetch the location details.
this is currently happening when we are redirecting the user. In future with lots of requests coming in the service call to geocoder may make the app slow.

   So for future version we need to move this service call to Analytic data tracking to a background Job so that it will be processed in background without blocking the redirection.

2. we need to improve our Random string generation logic. As it may sometimes generate conflicting short url for 2 different URL.

3. with lot of analytics data and lot more links getting created there may be some issues arise with the data accessibility may be a distributed architecture like creating some DB clusters.

This app is deployed on heroku

App URL : https://shortlly.herokuapp.com/

stats URL : https://shortlly.herokuapp.com/links/stats ( Note: as we are using /5character route for redirection purpose. Mounted stats on this path)


This is valid URL to test redirection

http://shortlly.herokuapp.com/2u8wv

This is URL which got expired to see 404 page

http://shortlly.herokuapp.com/shm5t
