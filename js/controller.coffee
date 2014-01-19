consumerApp = angular.module("consumerApp", [])
consumerApp.controller "EventCtrl", ($scope, $http) ->
  $scope.uid = ""
  $scope.actorEvents = ""
  token = "e2b0d1626176758db87335875634bbc8"
  base_url = "http://localhost:3024/api/"
  $http(
    method: "GET"
    url: base_url + "events"
    headers:
      Authorization: "Token token=" + token
  ).success (data) ->
    $scope.events = data.events

  $scope.findActor = ->
    unless $scope.uid is ""
      api_url = base_url + "actors/" + $scope.uid + "/list_events"
      $http(
        method: "GET"
        url: api_url
        headers:
          Authorization: "Token token=" + token
      ).success((data) ->
        angular.element(document.querySelector("#actor-events-data-area")).css "display", "block"
        $scope.actorEvents = data.actors
      ).error (status) ->
        angular.element(document.querySelector("#actor-events-data-area")).css "display", "none"
        alert "No actor found with UID " + $scope.uid

    else
      alert "Please enter valid actor uid"

