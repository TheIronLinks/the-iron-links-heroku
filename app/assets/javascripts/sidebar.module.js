(function () {
  "use strict";

  angular.module('sidebarRoute', [
    'ui.router'
  ])

  .config(function ($stateProvider, $urlRouterProvider) {
    $stateProvider
    .state('sidebar', {
      abstract: true,
      templateUrl: 'assets/sidebar/sidebarView.html'
    })

  });

})();
