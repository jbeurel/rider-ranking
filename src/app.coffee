'use strict'

app = angular.module 'angularParseBoilerplate', [
  'ng'
  'ngResource'
  'ngSanitize'
  'ui.router'
  'ui.bootstrap'
  'app.templates'
  'Parse'
  'ngNumeraljs'
  'angulartics'
  'angulartics.google.analytics'
  'daterangepicker'
]

app.config (
  $locationProvider
  $stateProvider
  $urlRouterProvider
  ParseProvider
) ->

  $locationProvider.hashPrefix '!'

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

  # rider-ranking
  ParseProvider.initialize(
    "f30zOn77dmpVbIk0O0mQccHSxGLA499vyIbgkpnq", # Application ID
    "JoaIvIhGQdvlT9ma5OiRV8GmUQo7BGhXjiC4YrEP"  # REST API Key
  )

  # rider-ranking-dev
#  ParseProvider.initialize(
#    "3IJVtcL7m5whPkj4Qi9tHTcNlTqDztQRFcKouSkh", # Application ID
#    "uiwPGvgsodjrUQLbJ9zy7tGIA0E6FI75YTE4Ma7S"  # REST API Key
#  )

app.run ($rootScope, $state) ->
  $rootScope.$state = $state
