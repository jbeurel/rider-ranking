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
  $locationProvider
  $stateProvider
  $urlRouterProvider
  ParseProvider
) ->

  $locationProvider.html5Mode true

  $stateProvider
  .state 'ranking',
    templateUrl: 'ranking.html'
  .state 'ranking.riders',
    url: '/riders'
    controller: 'RidersCtrl'
    templateUrl: 'riders.html'
  .state 'ranking.companies',
    url: '/companies'
    controller: 'CompaniesCtrl'
    templateUrl: 'companies.html'

  $urlRouterProvider.otherwise '/riders'

  ParseProvider.initialize(
    "f30zOn77dmpVbIk0O0mQccHSxGLA499vyIbgkpnq", # Application ID
    "JoaIvIhGQdvlT9ma5OiRV8GmUQo7BGhXjiC4YrEP"  # REST API Key
  )

app.run ($rootScope, $state) ->
  $rootScope.$state = $state
