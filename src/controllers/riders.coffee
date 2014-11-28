app.controller 'RidersCtrl', ($scope, Rider, Proposal) ->

  $scope.fetchRiders = ->
    Rider.query(
      order: '-followers'
    )
    .then (riders) ->
      $scope.riders = riders

  $scope.fetchRiders()

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal
