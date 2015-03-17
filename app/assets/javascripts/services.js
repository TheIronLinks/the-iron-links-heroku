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
        })
        .error(function(){
          console.log('service/add profile error');
        });
      };

      return {
        addProfile: addProfile
      };
    })

//==========================SEARCH SERVICE==========================

    .factory('SearchService', function ($http) {

      var gradResults = {
        data: []
      };

      var emplResults = {
        data: []
      };

      var jobResults = {
        data: []
      };

      var grad_url = '';
      var empl_url = '/employers/simple_employer_search.json';
      var job_url = '';

      var queryGrad = function (graduate_search) {

        $http({
          'url': grad_url,
          'method': 'GET',
          'params': graduate_search
        }).success(function(data){
          gradResults.data = data;
        });

      };

      var queryEmpl = function (employer_search) {

        $http({
          'url': empl_url,
          'method': 'GET',
          'params': employer_search
        }).success(function(data){
          emplResults.data = data;
        });

      };

      var queryJob = function (job_search) {

        $http({
          'url': job_url,
          'method': 'GET',
          'params': job_search
        }).success(function(data){
          jobResults.data = data;
        });

      };

      return {
        queryGrad: queryGrad,
        queryEmpl: queryEmpl,
        queryJob: queryJob,
        gradResults: gradResults,
        emplResults: emplResults,
        jobResults: jobResults,
      };
    });

})();
