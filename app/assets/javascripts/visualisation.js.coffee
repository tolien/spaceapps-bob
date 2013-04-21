# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$.getJSON "/airports.json", (data) ->
  airports = (new Airport o for o in data)
  console.log(airports)
  (o.draw() for o in airports)

 $.getJSON "/aircrafts.json", (data) ->
   aircrafts= (new Aircraft o for o in data)
   console.log(aircrafts)
   (o.draw() for o in aircrafts)


class Airport
  constructor: ({@name, @code, @latitude, @longitude}) ->

  draw: ->
    canvas = document.getElementById "vis"
    context = canvas.getContext "2d"
    context.fillRect @latitude, @longitude, 25, 25
    context.font = "12px Arial"
    context.fillText @code, @latitude, @longitude+40


class Aircraft
  constructor: ({@code, @destination_id, @source_id,  @latitude, @longitude}) ->

  draw: ->
    canvas = document.getElementById("vis")
    context = canvas.getContext("2d")
    context.fillRect @latitude, @longitude, 10, 10
    context.font = "12px Arial"
    context.fillText @code, @latitude - 10, @longitude+25

    
  move: ->
    