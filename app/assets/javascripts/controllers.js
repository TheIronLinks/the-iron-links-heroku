(function () {
    "use strict";
    angular.module('tilAPP')

//==========================CARD CTRL==========================
      .controller('CardController', ['FeaturesService', '$rootScope', function (FeaturesService, $rootScope) {

        var cardCtrl = this;


        CardService.getCards().success(function(data){
          cardCtrl.stack = data;
        })
        .error(function(){
          console.log('cardCtrl.stack error')
        });

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
          FeaturesService.sendMsg(msgObj);

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
          FeaturesService.sendMsg(msgObj);

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

        userCtrl.goToPanel = function() {
          console.log(userCtrl.currentUser.userable_type);
          if(userCtrl.currentUser.userable_type === 'Employer'){
            $location.url('/employer-panel')
          }else if(userCtrl.currentUser.userable_type === 'Graduate'){
            $location.url('/graduate-panel')
          }
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

        userCtrl.setUser();

        $scope.loggedIn = function() {
          return Auth.isAuthenticated();
        };

        $scope.submitSignUp = function() {
          var credentials = userCtrl.signUpCredentials;
          Auth.register(credentials).then(function(user) {
            userCtrl.setUser();
            if(userCtrl.type === 'graduate'){
               $location.url('/new-grad');
            }else if(userCtrl.type === 'employer'){
               $location.url('/new-employer');
            }
            // $scope.user = {};
          },function(error){
            userCtrl.error_message = error;
          });
        };

        $scope.submitLogin = function() {
          var credentials = userCtrl.loginCredentials;
          Auth.login(credentials).then(function(user) {
            console.log(user);
            userCtrl.setUser();
            if(user.userable_type === 'Graduate'){
              console.log('login as grad');
               $location.url('/graduate-panel');
             }else if(user.userable_type === 'Employer'){
               console.log('login as empl');
               $location.url('/employer-panel');
             }
          },function(error) {
            userCtrl.error_message = error;
            console.log(error);
          });
        };

        $scope.gotoSignup = function(){
          $location.url('/new-grad');
        };

        $scope.submitLogout = function() {
          Auth.logout().then(function(user) {
            userCtrl.setUser();
            $scope.goToHome();
          });
        };

        $scope.goToHome = function(){
          $location.path('/');
        };

      }])

//==========================ROUTE VALIDATION CTRL==========================

      .controller('RouteValidationController', ['$location', '$rootScope', 'Auth', function($location, $rootScope, Auth){

        //VALIDATE USER IS LOGGED IN*******************
        // if(Auth.isAuthenticated() === false){
        //   $location.path('/');
        // };
        //*********************************

      }])

//==========================PROFILE CTRL==========================
      .controller('ProfileController', ['ProfileService', '$location', '$route', function (ProfileService,$location, $route) {

        var profileCtrl = this;

        profileCtrl.getGradProfile = function() {
          ProfileService.getGradPanel();
        };

        profileCtrl.getEmplProfile = function() {
          ProfileService.getEmplPanel();
        };

        profileCtrl.routeTo = function (path){
          $location.url(path);
        };

        profileCtrl.addGradProfile = function (newProfile) {
          ProfileService.addGradProfile(newProfile);
        };

        profileCtrl.addEmplProfile = function (newProfile) {
          ProfileService.addEmplProfile(newProfile);
        };

        profileCtrl.updateGradProfile = function (gradProfile, id) {
          ProfileService.updateGradProfile(gradProfile, id)
          $('#form__close').click();
        };
        
        employerCtrl.getEmployer = function() {
          EmployerService.getPanel();
        }();

        profileCtrl.updateEmplProfile = function (emplProfile, id) {
          ProfileService.updateEmplProfile(emplProfile, id)
          $('#form__close').click();
        };

        profileCtrl.reloadPage = function () {
          $route.reload();
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
