app.controller 'CompaniesCtrl', ($scope, Rider, Proposal) ->

  Rider.getCompanies()
  .then (companies) ->
      $scope.companies = companies

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal
