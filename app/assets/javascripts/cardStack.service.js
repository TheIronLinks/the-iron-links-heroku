(function () {
  "use strict";
  angular.module('cardStackUI')

    .factory('CardService', function ($location,$http) {

      var url = 'http://localhost:3000/employers.json';

      var getCards = function () {
        return $http.get(url);
      };



      return {
        getCards: getCards
      };
    });
})();
