app.controller 'RidersCtrl', ($scope, Rider, Proposal, Metric) ->

  $scope.options =
    chart:
      type: 'lineChart',
      height: 450,
      margin : {
        top: 20,
        right: 20,
        bottom: 60,
        left: 55
      },
      x: (d) -> return d.date
      y: (d) -> return d.value

  updateTrend = (riders) ->
    _.forEach riders, (rider) ->
      Metric.findByRiderId(rider.objectId, $scope.dateRange.startDate, $scope.dateRange.endDate)
      .then (metrics) ->
        rider.metrics =
          key: "serie"
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
