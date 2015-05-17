app.controller 'RidersCtrl', ($scope, Rider, Proposal) ->

  Rider.getRiders()
  .then (riders) ->
    $scope.riders = riders

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal

  $scope.dateRange = startDate: moment().subtract(1, 'month'), endDate: moment()
