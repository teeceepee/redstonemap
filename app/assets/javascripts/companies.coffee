# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init_map = (map_container_id) ->
  if typeof BMap != 'undefined' and $('#' + map_container_id).length > 0
    map = new BMap.Map(map_container_id)
    # 显示用户所在城市
    localCity = new BMap.LocalCity()
    localCity.get (result) ->
      center = result.center
      level = result.level
      map.centerAndZoom(center, level)

    map
  else
    null

set_current_coords = (map_container_id, point) ->
  container = $('#' + map_container_id)
  container.data('coords', point)

get_current_coords = (map_container_id) ->
  $('#' + map_container_id).data().coords

$(document).on 'ready page:load', ->
  coords_map_id = 'rsm-coords-map'
  map = init_map(coords_map_id)

  if map
    map.addEventListener 'click', (e) ->
      lng = e.point.lng
      lat = e.point.lat
      $('#rsm-latlng').text(lng + ', ' + lat)

      set_current_coords(coords_map_id, e.point)
      console.log($('#' + coords_map_id).data())

  $('#rsm-coords-save-button').on 'click', ->
    coords = get_current_coords(coords_map_id)
    $('#company_latitude').val(coords.lat)
    $('#company_longitude').val(coords.lng)
