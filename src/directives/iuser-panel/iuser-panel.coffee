app.directive 'iuserPanel', ->
  restrict: 'A'
  templateUrl: 'iuser-panel/iuser-panel.html'
  scope:
    rider: '='
    position: '='
    colors: '=?'
    daterange: '='
  controller: ($scope, Metric) ->

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

    $scope.$watch 'daterange', ->
      console.log '$scope.daterange', $scope.daterange
      Metric.findByRiderId($scope.rider.objectId, $scope.daterange.startDate, $scope.daterange.endDate)
      .then (metrics) ->
        if metrics.length > 0
          $scope.rider.metrics =
            key: "followers"
            color: '#689DCA'
            area: true
            height: 170
            values: _.map metrics, (metric) -> return {date: metric.date.iso, value: metric.value}
          $scope.rider.trend = (_.last(metrics).value - _.first(metrics).value) / $scope.rider.followers
