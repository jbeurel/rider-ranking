'use strict';
var app;

app = angular.module('angularParseBoilerplate', ['ng', 'ngResource', 'ui.router', 'ui.bootstrap', 'app.templates', 'Parse', 'ngNumeraljs', 'angulartics', 'angulartics.google.analytics']);

app.config(function($locationProvider, $stateProvider, $urlRouterProvider, ParseProvider) {
  $stateProvider.state('ranking', {
    templateUrl: 'ranking.html'
  }).state('ranking.riders', {
    url: '/riders',
    controller: 'RidersCtrl',
    templateUrl: 'riders.html'
  }).state('ranking.companies', {
    url: '/companies',
    controller: 'CompaniesCtrl',
    templateUrl: 'companies.html'
  });
  $urlRouterProvider.otherwise('/riders');
  return ParseProvider.initialize("f30zOn77dmpVbIk0O0mQccHSxGLA499vyIbgkpnq", "JoaIvIhGQdvlT9ma5OiRV8GmUQo7BGhXjiC4YrEP");
});

app.run(function($rootScope, $state) {
  return $rootScope.$state = $state;
});

app.controller('CompaniesCtrl', function($scope, Rider, Proposal) {
  Rider.getCompanies().then(function(companies) {
    return $scope.companies = companies;
  });
  $scope.newProposal = new Proposal;
  return $scope.addProposal = function() {
    return $scope.newProposal.save().then(function() {
      return $scope.newProposal = new Proposal;
    });
  };
});

app.controller('RidersCtrl', function($scope, Rider, Proposal) {
  Rider.getRiders().then(function(riders) {
    return $scope.riders = riders;
  });
  $scope.newProposal = new Proposal;
  return $scope.addProposal = function() {
    return $scope.newProposal.save().then(function() {
      return $scope.newProposal = new Proposal;
    });
  };
});

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

app.factory('Proposal', function(Parse) {
  var Rider;
  return Rider = (function(_super) {
    __extends(Rider, _super);

    function Rider() {
      return Rider.__super__.constructor.apply(this, arguments);
    }

    Rider.configure("Proposal", "username");

    return Rider;

  })(Parse.Model);
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

    Rider.configure("Rider", "username", "id", "name", "type");

    Rider.getRiders = function() {
      return this.query({
        order: '-followers',
        where: {
          type: 'rider'
        }
      });
    };

    Rider.getCompanies = function() {
      return this.query({
        order: '-followers',
        where: {
          type: 'company'
        }
      });
    };

    return Rider;

  })(Parse.Model);
});
