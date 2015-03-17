(function () {
    "use strict";
    angular.module('tilAPP')

//==========================CARD CTRL==========================

      .controller('CardController', function (CardService) {

        var cardCtrl = this;

        CardService.getCards().success(function(data){
          cardCtrl.stack = data;
          console.log(data);

        })
        .error(function(){
          console.log('cardCtrl.stack error')
        });
      })

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
<<<<<<< HEAD
          var credentials = userCtrl.signUpCredentials;
          Auth.register(credentials).then(function(user) {
=======
          console.log(userCtrl.signUpCredentials);
          Auth.register(userCtrl.signUpCredentials).then(function(user) {
>>>>>>> 0238d0754f85f7d1c6c14fcbd65d6ac7b775da0d
            $scope.setUser();
            $scope.signUpCredentials='';
            $location.url('/newGrad');
          },function(error){
            userCtrl.error_message = error;
<<<<<<< HEAD
            console.log(error);
=======
>>>>>>> 0238d0754f85f7d1c6c14fcbd65d6ac7b775da0d
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

      .controller('ProfileController', function (ProfileService,$location) {

        var profileCtrl = this;

        profileCtrl.addProfile = function (newProfile) {
          ProfileService.addProfile(newProfile);
        };

        profileCtrl.routeTo = function (path) {
          $location.path(path);
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
