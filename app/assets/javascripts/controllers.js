(function () {
    "use strict";
    angular.module('tilAPP')

//==========================CARD CTRL==========================

      .controller('CardController',['CardService', function (CardService) {

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
          Auth.register(userCtrl.signUpCredentials).then(function(user) {
            $scope.setUser();
            $scope.signUpCredentials='';
            $location.url('/newGrad');
          },function(error){
            userCtrl.error_message = error;
            console.log(error);
          });
        };

        $scope.submitLogin = function() {
          var credentials = userCtrl.loginCredentials;
          Auth.login(credentials).then(function(user) {
            console.log(user);
            $scope.setUser();
            $scope.loginCredentials='';
          }, function(error) {
            userCtrl.error_message = error;
            console.log(error);
          });
        };

        $scope.submitLogout = function() {
          Auth.logout().then(function(user) {
            $scope.currentUser = user;
            $scope.setUser();
          });
        };

        $scope.goToHome = function(){
          $location.path('/');
        };
      }])

//==========================PROFILE CTRL==========================

      .controller('ProfileController',['ProfileService', '$location', function (ProfileService,$location) {

        var profileCtrl = this;

        profileCtrl.addProfile = function (newProfile) {
          ProfileService.addProfile(newProfile);
        };

        profileCtrl.routeTo = function (path) {
          $location.path(path);
        };

      }])

//==========================SEARCH CTRL==========================

      .controller('SearchController',['SerachService', function (SearchService) {

        var searchCtrl = this;
        searchCtrl.gradResults = SearchService.searchResults;

        // <li ng-repeat="card in gradResults.data">
        //   {{thing.name}}
        // </li>

        searchCtrl.queryGrad = function (graduate_search) {
          //console.log(graduate_search);
          SearchService.queryGrad(graduate_search);

          //console.log(searchResults);
        }

        searchCtrl.queryEmpl = function (employer_search) {
          console.log(employer_search);
          //var searchResults = SearchService.queryEmpl(employer_search);
          //console.log(searchResults);
        };

        searchCtrl.queryJob = function (job_search) {
          console.log(job_search);
          //var searchResults = SearchService.queryJob(job_search);
          //console.log(searchResults);
        };

      }])

})();
