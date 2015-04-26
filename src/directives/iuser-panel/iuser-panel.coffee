app.directive 'iuserPanel', ->
  restrict: 'A'
  templateUrl: 'iuser-panel/iuser-panel.html'
  scope:
    rider: '='
    position: '='
  controller: ($scope) ->
    $scope.options =
      chart:
        type: 'lineChart'
        margin :
          top: 0
          right: 0
          bottom: 0
          left: 0
        x: (d) -> return new Date(d.date)
        y: (d) -> return d.value
        showXAxis: false
        showYAxis: false
        showLegend: false
        xAxis:
          tickFormat: (d) ->
            return d3.time.format('%x')(new Date(d))