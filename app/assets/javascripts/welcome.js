(function () {
 'use strict';

  angular.module('tilAPP', [
    'ngRoute',
    'Devise',
    'ngAnimate',
    'uiGmapgoogle-maps',
    'twitter.timeline',
  ])

  .config(['uiGmapGoogleMapApiProvider', function(uiGmapGoogleMapApiProvider) {
    uiGmapGoogleMapApiProvider.configure({
      //    key: 'your api key',
      v: '3.17',
      libraries: 'weather,geometry,visualization'
    });
  }])

  .config(['$httpProvider', function($httpProvider) {
     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $("meta[name=csrf-token]").attr("content");
   }])

  .config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'assets/views/index.html'
      })
      .when('/graduatePanel', {
        templateUrl: 'assets/views/graduatePanel.html',
        controller: 'RouteValidationController'
      })
      .when('/newGrad', {
        templateUrl: 'assets/views/newGrad.html',
        controller: 'ProfileController as profileCtrl'
      })
      .when('/graduates', {
        templateUrl: 'assets/views/cardStackViews/gradCardView.html',
        controller: 'RouteValidationController'
      })
      .when('/employers', {
        templateUrl: 'assets/views/cardStackViews/emplCardView.html',
        controller: 'RouteValidationController'
      })
      .when('/jobs', {
        templateUrl: 'assets/views/cardStackViews/jobCardView.html',
        controller: 'RouteValidationController'
      })
      .when('/not-found', {
        templateUrl: 'assets/views/notFoundView.html'
      })
      .otherwise({
        redirectTo: '/not-found'
      });
  }])

  .constant('_',_);

})();
