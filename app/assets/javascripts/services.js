(function () {
  "use strict";
  angular.module('tilAPP')

//==========================CARD SERVICE==========================

    .factory('CardService', function ($location,$http) {

      var url = 'http://localhost:3000/employers.json';

      var getCards = function () {
        return $http.get(url);
      };



      return {
        getCards: getCards
      };
    })

//==========================PROFILE SERVICE==========================

    .factory('ProfileService', function ($location,$http) {

      var url = 'http://localhost:3000/graduates.josn';

      var addProfile = function (newProfile) {
        $http.post(url, newProfile).success(function(){
          $location.path("/graduates");
        })
        .error(function(){
          console.log('service/addProduct error');
        });
      };

      return {
        getCards: getCards,
        addProfile: addProfile
      };
    });
})();
