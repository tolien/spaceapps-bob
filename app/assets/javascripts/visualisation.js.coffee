# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->   
    gla = new Airport 50, 25
    gla.draw()
    b747= new Aircraft 100, 25
    b747.draw()
  
  
class Airport
  constructor: (@x, @y) ->

  draw: ->
    canvas = document.getElementById("vis")
    context = canvas.getContext("2d")
    context.fillRect @x, @y, 25, 25
    
    
class Aircraft
  constructor: (@x, @y) ->

  draw: ->
    canvas = document.getElementById("vis")
    context = canvas.getContext("2d")
    context.fillRect @x, @y, 5, 5