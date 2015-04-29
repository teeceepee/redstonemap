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
