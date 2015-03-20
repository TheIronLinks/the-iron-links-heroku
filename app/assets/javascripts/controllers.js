(function () {
    "use strict";
    angular.module('tilAPP')

//==========================CARD CTRL==========================

      .controller('CardController', ['CardService', function (CardService) {

        var cardCtrl = this;


        CardService.getCards().success(function(data){
          cardCtrl.stack = data;
        })
        .error(function(){
          console.log('cardCtrl.stack error')
        });

      }])

//==========================USER CTRL==========================

      .controller('userCtrl', ['$routeParams', '$location', '$scope', '_', 'Auth', function($routeParams, $location, $scope, _, Auth){

        var userCtrl = this;

        $scope.setUser = function() {
          Auth.currentUser().then(function(user) {
            userCtrl.currentUser = user;
            userCtrl.error_message = '';
          },function(error){
            userCtrl.currentUser = '';
            userCtrl.error_message = error;
          });
        };

        $scope.loggedIn = function() {
          return Auth.isAuthenticated();
          $scope.url('/welcomeView');

        };

        $scope.submitSignUp = function() {
          var credentials = userCtrl.signUpCredentials;
          Auth.register(credentials).then(function(user) {
            $scope.setUser();
            $scope.signUpCredentials='';
            $location.url('/newGrad');
          },function(error){
            userCtrl.error_message = error;
          });
        };

        $scope.submitLogin = function() {
          var credentials = userCtrl.loginCredentials;
          Auth.login(credentials).then(function(user) {
            console.log(user);
            $scope.setUser();
            $location.url('/graduatePanel')
          }, function(error) {
            userCtrl.error_message = error;
            console.log(error);
          });
        };

        $scope.submitLogout = function() {
          Auth.logout().then(function(user) {
            $scope.currentUser = user;
            $scope.setUser();
            $scope.goToHome();
          });
        };

        $scope.goToHome = function(){
          $location.path('/');
        };
      }])

//==========================PROFILE CTRL==========================

      .controller('ProfileController', ['ProfileService', '$location', function (ProfileService,$location) {

        var profileCtrl = this;
        profileCtrl.userData = ProfileService.userData;

        profileCtrl.addProfile = function (newProfile) {
          ProfileService.addProfile(newProfile);
        };

        profileCtrl.routeTo = function (path){
          $location.url(path);
        };

        profileCtrl.getProfile = function() {
          profileCtrl.panel = ProfileService.getPanel;
          console.log('hello');
        };


      }])

//==========================SEARCH CTRL==========================

      .controller('SearchController', ['SearchService', '$location', '$scope', function (SearchService,$location,$scope) {

        var searchCtrl = this;

        searchCtrl.gradResults = SearchService.gradResults;
        searchCtrl.emplResults = SearchService.emplResults;
        searchCtrl.jobResults = SearchService.jobResults;

        searchCtrl.queryGrad = function (graduate_search) {
          SearchService.queryGrad(graduate_search);
          $scope.graduate_search = {};
        };


        searchCtrl.queryEmpl = function (employer_search) {
          SearchService.queryEmpl(employer_search);
          $scope.employer_search = {};
        };

        searchCtrl.queryJob = function (job_search) {
          SearchService.queryJob(job_search);
          $scope.job_search = {};
        };

        searchCtrl.routeTo = function (path) {
          $location.path(path);
        };

      }]);

})();
