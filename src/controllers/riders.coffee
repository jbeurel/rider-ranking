app.controller 'RidersCtrl', ($scope, Rider, Proposal, Metric) ->

  Rider.getRiders()
  .then (riders) ->
    $scope.riders = riders
    _.forEach riders, (rider) ->
      Metric.findByRiderId(rider.objectId)
      .then (metrics) ->
        rider.metrics = metrics

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal
