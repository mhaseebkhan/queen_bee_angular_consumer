var consumerApp = angular.module('consumerApp', []);


consumerApp.controller('EventCtrl', function ($scope, $http) {
$http({method: 'GET', url: 'http://localhost:3024/api/events', headers: {'Authorization': 'Token token=e2b0d1626176758db87335875634bbc8'}}).success(function(data) {
$scope.events = data.events;
});


});
