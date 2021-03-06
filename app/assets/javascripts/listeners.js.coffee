# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Everything below is used to get the user's location and assign it to the listener object via HTML5. Most of the functions
# below are standard, widely available functions created to access said information.
urlholder = undefined
position = new Array()
#message = undefined
$(document).ready ->
  urlholder = window.location.pathname
  $("#storeLink").hide()
  $("#getGeo").on "click", ->
    onSuccess = (pos) ->
      position[0] = pos.coords.latitude
      position[1] = pos.coords.longitude
      $("#listener_lng").val(position[1])
      $("#listener_lat").val(position[0])
      $("#storeLink").show()
      $("#storeLink").prepend("<div class = 'simple-center' style = 'text-align: center;'><em>Location Received<em></div>")

    onError = (err) ->
      switch err.code
        when 0
          alert "Unknown error: " + err.message
        when 1
          alert "You denied permission to use GPS information."
        when 2
          alert "The browser was unable to determine a position. Give it another shot, and if that doesn't work, just enter an address."
        when 3
          alert "The browser timed out before receiving the position. Give it another shot, and if that doesn't work, just enter an address."
    navigator.geolocation.getCurrentPosition onSuccess, onError,
      enableHighAccuracy: true
      timeout: 20000
      maximumAge: 120000
