(function () {
  "use strict";
  angular.module('tilAPP')

//==========================FEATURES SERVICE==========================

    .factory('FeaturesService', ['$location', '$http', function ($location,$http) {

      var msgUrl = '/messages.json';
      var favUrl = '/graduates/like_employer.json';
      var unfavUrl = '/graduates/unlike_employer.json';

      var sendMsg = function (passed) {
        $http.post(msgUrl, passed)
        .success(function(){
          console.log('msg sent to server');
        })
        .error(function(){
          console.log('failed sending msg to server');
        });
      };

      var favCard = function (passed) {
        $http.post(favUrl, passed)
        .success(function(){
          console.log('fav sent to server');
        })
        .error(function(){
          console.log('failed sending fav to server');
        });
      };

      var unfavCard = function (passed) {
        $http.post(unfavUrl, passed)
        .success(function(){
          console.log('unfav sent to server');
        })
        .error(function(){
          console.log('failed sending unfav to server');
        });
      };

      return {
        sendMsg: sendMsg,
        favCard: favCard,
        unfavCard: unfavCard
      };
    }])

//==========================PROFILE SERVICE==========================

    .factory('ProfileService',['$location', '$http', function ($location,$http) {

      var gradUrl = '/graduates.json';
      var emplUrl = '/employers.json';

      var userData = {
        profileData: {
          graduate: {
            first_name: "",
            last_name: "",
            grad_city: "",
            grad_state: "",
            grad_date: "",
            grad_focus: "",
            current_location: "",
            additional_info: "",
            image_url: ""
          },
          employer: {
            name: "",
            industry: "",
            founded: "",
            size: "",
            city: "",
            state: "",
            zip: "",
            image_url: "",
          }
        }
      };

      var addGradProfile = function (newProfile) {
        $http.post(gradUrl, newProfile).success(function(){
          $location.url('/graduate-panel');
        })
        .error(function(){
          console.log('service/add profile error');
        });
      };

      var addEmplProfile = function (newProfile) {
        $http.post(emplUrl, newProfile).success(function(){
          $location.url('/employer-panel');
        })
        .error(function(){
          console.log('service/add profile error');
        });
      };


      var getGradPanel = function() {
        $http.get('/graduates/get_grad.json')
        .success(function(data){
          console.log(data)
          userData.profileData = data;
          console.log(userData.profileData)
        });
      };
      return {
        addGradProfile: addGradProfile,
        addEmplProfile: addEmplProfile,
        userData: userData,
        getGradPanel: getGradPanel,
        getEmplPanel: getEmplPanel,
        updateEmplProfile: updateEmplProfile,
        updateGradProfile: updateGradProfile
      };
    }])

//==========================EMPLOYER SERVICE==========================

  

//==========================EMPLOYER SERVICE==========================
    //
    // .factory('EmployerService', function ($location,$http) {
    //
    //   var url = '/employers.json';
    //
    //   var employerData = {
    //     empData: {
    //
    //       }
    //     };
    //
    //   var addProfile = function (newEmployer) {
    //     $http.post(url, newEmployer).success(function(){
    //       $location.url('/graduate-panel');
    //     })
    //     .error(function(){
    //       console.log('service/add employer error');
    //     });
    //   };
    //
    //   var getPanel = function() {
    //     $http.get('/employers/get_employer.json')
    //     .success(function(data){
    //       console.log(data)
    //       userData.employerData = data;
    //       console.log(userData.employerData)
    //     });
    //   };
    //   return {
    //     addEmployer: addEmployer,
    //     userData: userData,
    //     getPanel: getPanel
    //   };
    //     })
//==========================SEARCH SERVICE==========================

    .factory('SearchService',['$http', function ($http) {

      var gradResults = {
        data: []
      };

      var emplResults = {
        data: []
      };

      var jobResults = {
        data: []
      };

      var grad_url = '/graduates/search_graduates.json';
      var empl_url = '/employers/employer_search.json';
      var job_url = '/job_listings/search_job_listings.json';

      var queryGrad = function (graduate_search) {

        $http({
          url: grad_url,
          method: 'GET',
          params: graduate_search
        }).success(function(data){
          gradResults.data = data;
          console.log(gradResults.data);
        });

      };

      var queryEmpl = function (employer_search) {

        $http({
          url: empl_url,
          method: 'GET',
          params: employer_search
        }).success(function(data){
          emplResults.data = data;
          console.log(emplResults.data);
        });

      };

      var queryJob = function (job_search) {

        $http({
          url: job_url,
          method: 'GET',
          params: job_search
        }).success(function(data){
          jobResults.data = data;
          console.log(jobResults.data);
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
    }]);

})();
