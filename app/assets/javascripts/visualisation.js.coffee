# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.getJSON "/airports.json", (data) ->
  airports = (new Airport o for o in data)
  console.log(airports)
  (o.draw() for o in airports)

# $.getJSON "/aircrafts.json", (data) ->
#   aircrafts= (new Aircrafts o for o in data)
#   console.log(aircrafts)
#   (o.draw() for o in aircrafts)


class Airport
  constructor: ({@name, @code, @latitude, @longitude}) ->

  draw: ->
    canvas = document.getElementById("vis")
    context = canvas.getContext("2d")
    context.fillRect @latitude, @longitude, 25, 25


class Aircraft
  constructor: (@x, @y) ->

  draw: ->
    canvas = document.getElementById("vis")
    context = canvas.getContext("2d")
    context.fillRect @x, @y, 5, 5