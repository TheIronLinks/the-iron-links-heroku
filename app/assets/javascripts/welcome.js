// This is your app.js file.
(function () {
  'use strict';

  angular.module('tilAPP', [
    'sidebarRoute',
    //''cardstackRoute',
    'ui.router'
  ])
  .config(function ($stateProvider, $urlRouterProvider) {
    $stateProvider
      .state('main', {
        abstract: true,
        templateUrl: 'assets/views/core/main.html'
      })
      .state('main.home', {
        url: '/',
        views: {
          'sidebar': {
            templateUrl: 'assets/views/sidebar/sidebarView.html'
          },
           'cardstack': {
             templateUrl: 'assets/views/cardstack/cardstackView.html'
           }
        }
      })
  })

  .constant('_',_);


})();
