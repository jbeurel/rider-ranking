angular.module("app.templates", []).run(["$templateCache", function($templateCache) {$templateCache.put("ranking.html","<h1>Ranking !</h1><ul><li ng-repeat=\"rider in riders\"><img src=\"{{ rider.profilePicture }}\">{{ rider.username }}</li></ul>");}]);