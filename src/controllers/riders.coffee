app.controller 'RidersCtrl', ($scope, Rider, Proposal, Metric) ->

  Rider.getRiders()
  .then (riders) ->
    $scope.riders = riders
    _.forEach riders, (rider) ->
      Metric.findByRiderId(rider.objectId)
      .then (metrics) ->
        rider.metrics = metrics
        rider.trend = (_.last(metrics).value - _.first(metrics).value) / rider.followers

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal
