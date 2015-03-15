(function () {
    "use strict";
    angular.module('tilAPP')
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
