'use strict';
var app;

app = angular.module('angularParseBoilerplate', ['ng', 'ngResource', 'ui.router', 'ui.bootstrap', 'app.templates', 'Parse', 'ngNumeraljs']);

app.config(function($stateProvider, $urlRouterProvider, ParseProvider) {
  $stateProvider.state('homepage', {
    url: '/',
    controller: 'RankingCtrl',
    templateUrl: 'ranking.html'
  });
  $urlRouterProvider.otherwise('/');
  return ParseProvider.initialize("f30zOn77dmpVbIk0O0mQccHSxGLA499vyIbgkpnq", "JoaIvIhGQdvlT9ma5OiRV8GmUQo7BGhXjiC4YrEP");
});

app.run(function($rootScope, $state) {
  return $rootScope.$state = $state;
});

app.controller('RankingCtrl', function($scope, Rider) {
  $scope.fetchRiders = function() {
    return Rider.query({
      order: '-followers'
    }).then(function(riders) {
      return $scope.riders = riders;
    });
  };
  return $scope.fetchRiders();
});

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

app.factory('Rider', function(Parse) {
  var Rider;
  return Rider = (function(_super) {
    __extends(Rider, _super);

    function Rider() {
      return Rider.__super__.constructor.apply(this, arguments);
    }

    Rider.configure("Rider", "username", "id", "name");

    return Rider;

  })(Parse.Model);
});
