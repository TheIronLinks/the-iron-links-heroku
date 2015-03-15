(function () {
    "use strict";
    angular.module('tilAPP')
      .controller('ProfileController', function (ProfileService,$location) {

        var profileCtrl = this;

        profileCtrl.addProfile = function (newProfile) {
          ProfileService.addProfile(newProfile);
          $scope.newProfile = {};
        };

        profileCtrl.routeTo = function (path) {
          $location.path(path);
        };

      });
})();
