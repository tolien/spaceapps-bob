[![BuildStatus](https://secure.travis-ci.org/tolien/spaceapps-bob.png)](http://travis-ci.org/tolien/spaceapps-bob)

spaceapps-bob
=============
An attempt at the ["No Delays" Air Traffic Management challenge] [1] for NASA's Space Apps Challenge.

To do:
------

This was built in the course of about 18 hours of effort; it's a long way from complete!

- update visualisation to use real coordinates
	- it would be handy if we could store the *actual* coordinates of planes and aircraft, even if the model assumes a flat earth
	-   translate_coords_for_canvas(aircraft_to_draw, all_aircraft, width, height) might be helpful...
- regular updates
	- the point of this is to build a simulation, so there has to be a way to update the state of the world on a regular basis
	- the Rails Way to do this seems to be a cronjob using curl, with a controller which does the work required
- aircraft in flight
	- just now, aircraft are pretty much stuck at an airport, either the one they're leaving or the one they've arrived at. They obviously don't do that in the Real World.	
	- collision detection
- do something useful with aircraft on the ground
	- before worrying about ~~snakes on~~ planes in the air, it would be nice to do something useful with planes on the ground
	- this means adding new data on aircraft
		- fuel available
		- fuel burnt per unit time (enhancement: vary this with activity; more fuel will be burned in flight than on the ground)
			- this would be enhanced by *regular updates*
	- also adding new data on airports
		- how many aircraft can be sitting at an airport?
		- how many aircraft can take off at once?
- reporting (but not using Jasper…)
	- it would be handy if the simulation could show certain metrics
		- time waiting at airport / to land
		- cost incurred (time in flight * amount of fuel burned per unit time * cost of some quantity of fuel)
  	- how long are planes on the ground, waiting to take off?
  	- how long are planes waiting to land?
  		- this is sort of a light version of *aircraft in flight*
- authentication
	- some features would be better if they required authentication (deleting airports, for instance)
	- we did start setting up Devise, but disabled it because ALL the tests failed

[1]: http://spaceappschallenge.org/challenge/no-delays-air-traffic-management/
