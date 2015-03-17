(function () {
    "use strict";
    angular.module('tilAPP')

//==========================CARD CTRL==========================

      .controller('CardController', function (CardService) {

        var cardCtrl = this;

        CardService.getCards().success(function(data){
          cardCtrl.stack = data;
        })
        .error(function(){
          console.log('cardCtrl.stack error')
        });

      })

//==========================USER CTRL==========================

      .controller('userCtrl', ['$routeParams', '$location', '$scope', '_', 'Auth', function($routeParams, $location, $scope, _, Auth){

        $scope.setUser = function() {
          Auth.currentUser().then(function(user) {
            $scope.currentUser = user;
            $scope.error_message = '';
          },function(error){
            $scope.currentUser = '';
            $scope.error_message = error;
            console.log(error);
          });
        };

        $scope.loggedIn = function() {
          return Auth.isAuthenticated();
        };

        $scope.submitSignUp = function() {
          var credentials = $scope.signUpCredentials;
          Auth.register(credentials).then(function(user) {
            $scope.setUser();
            $scope.signUpCredentials='';
            $location.path('/newGrad');
          },function(error){
            $scope.error_message = error;
            console.log(error);
          });
        };

        $scope.submitLogin = function() {
          var credentials = $scope.loginCredentials;
          Auth.login(credentials).then(function(user) {
            console.log(user);
            $scope.setUser();
            $scope.loginCredentials='';
          }, function(error) {
            $scope.error_message = error;
            console.log(error);
          });
        };

        $scope.submitLogout = function() {
          Auth.logout().then(function(user) {
            $scope.setUser();
          });
        };
        $scope.setUser();
      }])

//==========================PROFILE CTRL==========================

      .controller('ProfileController', function (ProfileService,$location) {

        var profileCtrl = this;

        profileCtrl.addProfile = function (newProfile) {
          ProfileService.addProfile(newProfile);
          $scope.newProfile = {};
        };

        profileCtrl.routeTo = function (path) {
          $location.path(path);
        };

      })

//==========================SEARCH CTRL==========================

      .controller('SearchController', function (SearchService) {

        var searchCtrl = this;

        searchCtrl.queryGrad = function (graduate_search) {
          console.log(graduate_search);
          //var searchResults = SearchService.queryGrad(graduate_search);
          //console.log(searchResults);
        };

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

      })


//==========================AUTHENTICATION CTRL==========================

      .controller('AuthenticationController', function (ProfileService,$location,Auth) {

        var authCtrl = this;

        authCtrl.adminCheck = function () {
          Auth.currentUser().then(function(user) {
            if(user.accountType === 'admin'){
              return true;
            }else{
              return false;
            }
          },function(error){
            return false;
            console.log('ERROR: authCtrl.adminCheck')
          });
        };

        authCtrl.emplCheck = function () {
          Auth.currentUser().then(function(user) {
            if(user.accountType === 'employee'){
              return true;
            }else{
              return false;
            }
          },function(error){
            return false;
            console.log('ERROR: authCtrl.adminCheck')
          });
        };

        authCtrl.gradCheck = function () {
          Auth.currentUser().then(function(user) {
            if(user.accountType === 'graduate'){
              return true;
            }else{
              return false;
            }
          },function(error){
            return false;
            console.log('ERROR: authCtrl.adminCheck')
          });
        };

      });

})();
