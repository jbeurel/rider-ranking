'use strict'

app = angular.module 'angularParseBoilerplate', [
  'ng'
  'ngResource'
  'ui.router'
  'ui.bootstrap'
  'app.templates'
  'Parse'
  'ngNumeraljs'
  'angulartics'
  'angulartics.google.analytics'
]

app.config (
  $stateProvider
  $urlRouterProvider
  ParseProvider
) ->

  $stateProvider
  .state 'homepage',
    url: '/'
    controller: 'RankingCtrl'
    templateUrl: 'ranking.html'

  $urlRouterProvider.otherwise '/'

  ParseProvider.initialize(
    "f30zOn77dmpVbIk0O0mQccHSxGLA499vyIbgkpnq",
    "JoaIvIhGQdvlT9ma5OiRV8GmUQo7BGhXjiC4YrEP"
  )

app.run ($rootScope, $state) ->
  $rootScope.$state = $state
