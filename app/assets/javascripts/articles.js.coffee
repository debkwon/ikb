# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".categories_select").on "change", ->
    $.ajax
      url: "/update_topics"
      type: "GET"
      dataType: "script"
      remote: true
      data: 
        category_id: $('.categories_select option:selected').val()
        

$(document).ready ->
  $("category_search").on "submit", ->
  $.ajax
    url: "/search"
    type: "GET"
    dataType: "script"
    remote: true
    data:
      category_id: $('.category_search option:selected').val()