app.controller 'RidersCtrl', ($scope, Rider, Proposal, Metric) ->

  updateTrend = (riders) ->
    _.forEach riders, (rider) ->
      Metric.findByRiderId(rider.objectId, $scope.dateRange.startDate, $scope.dateRange.endDate)
      .then (metrics) ->
        if metrics.length > 0
          rider.metrics =
            key: "followers"
            color: '#689DCA'
            area: true
            height: 170
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
