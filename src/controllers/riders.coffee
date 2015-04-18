app.controller 'RidersCtrl', ($scope, Rider, Proposal, Metric) ->

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

  updateTrend = (riders) ->
    _.forEach riders, (rider) ->
      Metric.findByRiderId(rider.objectId, $scope.dateRange.startDate, $scope.dateRange.endDate)
      .then (metrics) ->
        rider.metrics =
          key: "followers"
          color: '#689DCA'
          area: true
          values: _.map metrics, (metric) -> return {date: metric.date.iso, value: metric.value}
        rider.trend = (_.last(metrics).value - _.first(metrics).value) / rider.followers

  Rider.getRiders()
  .then (riders) ->
    $scope.riders = riders
    updateTrend(riders)

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal

  $scope.dateRange = startDate: null, endDate: null

  $scope.$watch 'dateRange', ->
    updateTrend($scope.riders)
