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

      var url = 'http://localhost:3000/graduates.json';

      var addProfile = function (newProfile) {
        $http.post(url, newProfile).success(function(){
          $location.path("/graduates");
        })
        .error(function(){
          console.log('service/addProduct error');
        });
      };

      return {
        addProfile: addProfile
      };
    })

//==========================SEARCH SERVICE==========================

    .factory('SearchService', function ($http) {

      var searchResults = {
        data: []
      };

      var url = 'http://10.0.10.95:3000/employers/simple_employer_search.json';

      var queryGrad = function (graduate_search) {

        $http({
          'url': url,
          'method': 'GET',
          'params': graduate_search
        }).success(function(data){
          searchResults.data = data;
        });
      };

      var queryEmpl = function (employer_search) {

        return $http({
          'url': url,
          'method': "GET",
          'params': employer_search
        });
      };

      var queryJob = function (job_search) {

        return $http({
          'url': url,
          'method': "GET",
          'params': job_search
        });
      };

      return {
        queryGrad: queryGrad,
        queryEmpl: queryEmpl,
        queryJob: queryJob,
        searchResults: searchResults
      };
    });

})();
