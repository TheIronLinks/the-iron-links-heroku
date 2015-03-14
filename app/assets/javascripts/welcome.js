// This is your app.js file.
(function () {
  'use strict';

  angular.module('tilAPP', [
    'ngRoute',
    'Devise',
    'cardStackUI'
  ])
  .config(['$httpProvider', function($httpProvider) {
     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $("meta[name=csrf-token]").attr("content");
   }])
  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'assets/views/index.html'
      })
      .when('/newGrad', {
        templateUrl: 'assets/views/newGrad.html'
      })
      .when('/cardStackView', {
        templateUrl: 'assets/views/cardstack/cardStackView.html'
      })
    })
  }])
  .constant('_',_);
})();
