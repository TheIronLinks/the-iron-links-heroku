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
<<<<<<< HEAD
  }])
=======
      .when('/newGrad', {
        templateUrl: 'assets/views/newGrad.html'
      })
  })
>>>>>>> c77e24be9eca1b1a050fd0d88749e42b2304e2f1
  .constant('_',_);
})();
