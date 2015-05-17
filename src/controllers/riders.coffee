app.controller 'RidersCtrl', ($scope, Rider, Proposal) ->

  Rider.getRiders()
  .then (riders) ->
    $scope.riders = riders

  $scope.newProposal = new Proposal

  $scope.addProposal = ->
    $scope.newProposal.save().then () ->
      $scope.newProposal = new Proposal

  $scope.dateRange = startDate: moment().subtract(1, 'month'), endDate: moment()

  $scope.options =
    maxDate: moment()
    opens: 'left'
    ranges:
      'Last 7 Days': [moment().subtract(6, 'days'), moment()],
      'Last 30 Days': [moment().subtract(29, 'days'), moment()],
      'This Month': [moment().startOf('month'), moment().endOf('month')],
      'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
