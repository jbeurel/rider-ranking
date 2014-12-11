app.controller 'RidersCtrl', ($scope, Rider, Proposal) ->

  $scope.fetchRiders = ->
    Rider.getRiders()
    .then (riders) ->
      $scope.riders = riders

  $scope.fetchRiders()

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal
