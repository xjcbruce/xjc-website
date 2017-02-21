# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 功能函数定义
cityOption = (city) -> "<option value=\"" + city.code + "\">" + city.name + "</option>"

getSubCities = ->
  father_code = $('#order_addr_province').find('option:selected').val()
  $.getJSON('/welcome/sub_cities.json?prov='+father_code, (cities) ->
    if cities.length == 0
      $('#order_addr_city').hide()
    else
      options = ""
      options = options + cityOption(city) for city in cities
      $('#order_addr_city').html options
      $('#order_addr_city').show()
  )

# 事件
$(document).ready -> getSubCities()

$('#order_addr_province').change -> getSubCities()

