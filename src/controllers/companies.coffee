app.controller 'CompaniesCtrl', ($scope, Rider, Proposal) ->

  Rider.getCompanies()
  .then (riders) ->
    $scope.riders = riders

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal

  $scope.dateRange = startDate: null, endDate: null
