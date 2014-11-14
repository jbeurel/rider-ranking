app.controller 'RankingCtrl', ($scope, Rider, Proposal) ->

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

#
#  $scope.removeTask = (task) ->
#    task.destroy().then () ->
#      _.remove $scope.tasks, (task) ->
#        task.objectId is null
#
#  $scope.editingTask = (task) ->
#    task.editing = true
#
#  $scope.editTask = (task) ->
#    task.save()
#    task.editing = false
#
#  $scope.cancelEditing = (task) ->
#    task.title = task._cache.title
#    task.editing = false
#
#  $scope.fetchTasks = ->
#    Task.query()
#    .then (tasks) ->
#      $scope.tasks = tasks
#
#  $scope.fetchTasks()
#  $scope.newTask = new Task
