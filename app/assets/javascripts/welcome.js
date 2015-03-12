// This is your app.js file.
(function () {
  'use strict';

  angular.module('tilAPP', [
    'ngRoute'
  ])
  .config(function($httpProvider) {
     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $("meta[name=csrf-token]").attr("content");
   })
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'assets/views/cardStack/cardStackView.html'
      })
  })
  .constant('_',_);
})();
