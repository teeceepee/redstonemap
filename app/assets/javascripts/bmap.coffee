get_company_coords = ->
  JSON.parse($('meta[name=company_coords]').attr('content'))

add_markers = (map, company_coords) ->
  for coord in company_coords
    marker = new BMap.Marker(new BMap.Point(coord.longitude, coord.latitude))
    map.addOverlay(marker)

$(document).on 'ready page:load', ->
  if typeof BMap != 'undefined' and $('#map-container').length > 0
    map = new BMap.Map('map-container')
    console.log map

    # 显示用户所在城市
    localCity = new BMap.LocalCity()
    localCity.get (result) ->
      center = result.center
      level = result.level
      console.log(center)
      map.centerAndZoom(center, level)

    company_coords = get_company_coords()
    add_markers(map, company_coords)
