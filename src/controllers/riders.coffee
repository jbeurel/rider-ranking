app.controller 'RidersCtrl', ($scope, Rider, Proposal) ->

  Rider.getRiders()
  .then (riders) ->
    $scope.riders = riders

  Rider.getCompanies()
  .then (companies) ->
      $scope.companies = companies

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal
