(function () {
    "use strict";
    angular.module('tilAPP')

//==========================CARD CTRL==========================

      .controller('CardController', ['FeaturesService', '$rootScope', function (FeaturesService, $rootScope) {

        var cardCtrl = this;



        cardCtrl.selectedCard =function(passedProfile) {

          cardCtrl.activeCard = [passedProfile];
          console.log('active card loaded');
          console.log(cardCtrl.activeCard);

        };

        cardCtrl.clearActiveCard = function () {

          cardCtrl.activeCard = [];
          console.log('active card cleared');

        };

        cardCtrl.sendGradMsg = function (passed) {

          var msgObj = {
            message: {
              receiver_id:passed.graduate.id,
              title: passed.message_from_card.subject,
              content:passed.message_from_card.content,
              message_type: 'message',
              receiver_type: passed.graduate.class
            }
          };
          console.log(msgObj);
          cardCtrl.clearActiveCard();
          MsgService.sendMsg(msgObj);

        };

        cardCtrl.sendEmplMsg = function (passed) {

          var msgObj = {
            message: {
              receiver_id:passed.employer.id,
              title: passed.message_from_card.subject,
              content:passed.message_from_card.content,
              message_type: 'message',
              receiver_type: passed.employer.class
            }
          };
          console.log(msgObj);
          cardCtrl.clearActiveCard();
          MsgService.sendMsg(msgObj);

        };

        cardCtrl.favoriteEmpl = function (passed) {
          var favObj = {
            receiver_id:passed.employer.id
          };

          console.log('getting to favorite in ctrl');
          console.log(passed);
          FeaturesService.favCard(favObj);
        };

        cardCtrl.unfavoriteEmpl = function (passed) {
          var favObj = {
            receiver_id:passed.employer.id
          };

          console.log('getting to unfavorite in ctrl');
          console.log(passed);
          FeaturesService.unfavCard(favObj);
        };

      }])

//==========================USER CTRL==========================

      .controller('userCtrl', ['$routeParams', '$location', '$scope', '_', 'Auth', function($routeParams, $location, $scope, _, Auth){

        var userCtrl = this;

        var cleanSignUpCredentials = {
          email: '',
          password: '',
          password_confirmation: ''
        };
        var cleanLoginCredentials = {
          email: '',
          password: ''
        };



        userCtrl.setUser = function() {
          Auth.currentUser().then(function(user) {
            userCtrl.currentUser = user;
            userCtrl.error_message = '';
          },function(error){
            userCtrl.currentUser = '';
            userCtrl.error_message = error;
          });
        };

        userCtrl.resetUser = function(){
          userCtrl.loginCredentials = cleanLoginCredentials;
          userCtrl.signUpCredentials = cleanSignUpCredentials;
        }();

        userCtrl.setUser();

        $scope.loggedIn = function() {
          return Auth.isAuthenticated();
        };

        $scope.submitSignUp = function() {
          var credentials = userCtrl.signUpCredentials;
          Auth.register(credentials).then(function(user) {
            userCtrl.setUser();
            userCtrl.resetUser();
            $location.url('/newGrad');
          },function(error){
            userCtrl.error_message = error;

          });
        };

        $scope.submitLogin = function() {
          var credentials = userCtrl.loginCredentials;
          Auth.login(credentials).then(function(user) {
            console.log(user);
            userCtrl.resetUser();
            userCtrl.setUser();
            $location.url('/graduatePanel')
          }, function(error) {
            userCtrl.error_message = error;
            console.log(error);
          });
        };

        $scope.gotoSignup = function(){
          $location.url('/newGrad');
        };

        $scope.submitLogout = function() {
          Auth.logout().then(function(user) {
            userCtrl.resetUser();
            userCtrl.setUser();
            $scope.goToHome();
          });
        };

        $scope.goToHome = function(){
          $location.path('/');
        };

        $scope.goToPanel = function(){
          $location.path('/graduatePanel');
        };

      }])

//==========================ROUTE VALIDATION CTRL==========================

      .controller('RouteValidationController', ['$location', 'Auth', function($location, Auth){

        //VALIDATE USER IS LOGGED IN*******************
        if(Auth.isAuthenticated() === false){
          $location.path('/');
        };
        //*********************************

      }])

//==========================PROFILE CTRL==========================

      .controller('ProfileController', ['ProfileService', '$location', function (ProfileService,$location) {

        var profileCtrl = this;
        profileCtrl.userData = ProfileService.userData;


        profileCtrl.getProfile = function() {
          ProfileService.getPanel();
        }();

        profileCtrl.routeTo = function (path){
          $location.url(path);
        };

        profileCtrl.addProfile = function (newProfile) {
          ProfileService.addProfile(newProfile);
        };






      }])

//==========================EMPLOYER CTRL==========================

      .controller('EmployerController', ['EmployerService', '$location', function (EmployerService,$location) {

        var employerCtrl = this;
        employerCtrl.userData = EmployerService.userData;


        employerCtrl.addEmployer = function (newEmployer) {
          EmployerService.addEmployer(newEmployer);
        };

        employerCtrl.routeTo = function (path){
          $location.url(path);
        };

        employerCtrl.getEmployer = function() {
          EmployerService.getPanel();
        }();


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
