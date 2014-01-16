var consumerApp = angular.module('consumerApp', []);

consumerApp.controller('EventCtrl', function ($scope, $http) {
  $http({method: 'GET', url: 'http://localhost:3024/api/events', headers: {'Authorization': 'Token token=a0c8155c0161353ee90a61ef764f77a7'}}).success(function(data) {
    $scope.events = data.events;
  });
});
