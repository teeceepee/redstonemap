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

    # 左上角，添加默认缩放平移控件
    top_left_navigation = new BMap.NavigationControl()
    map.addControl(top_left_navigation)

    # 左下角，添加默认比例尺
    bottom_left_control = new BMap.ScaleControl()
    map.addControl(bottom_left_control)

    # 显示用户所在城市
    localCity = new BMap.LocalCity()
    localCity.get (result) ->
      center = result.center
      level = result.level
      console.log(center)
      map.centerAndZoom(center, level)

    company_coords = get_company_coords()
    add_markers(map, company_coords)
