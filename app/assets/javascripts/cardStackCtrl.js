
(function () {
  "use strict";
  angular.module('tilAPP')
    .controller('CardStackController', function($routeParams,$location,$scope,_){

      var cardCtrl = this;

      cardCtrl.routeTo = function (path) {
        $location.path(path);
      };

  });

})();
