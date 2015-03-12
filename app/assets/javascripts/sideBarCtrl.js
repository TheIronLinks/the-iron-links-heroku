(function () {
  "use strict";
  angular.module('sidebarRoute')
    .controller('sidebarController', function(SidebarService,$stateParams,$location,$scope,_){

      var sideCtrl = this;

      SidebarService.getUser().success(function(data){
        sideCtrl.getUser = data;
      })
      .error(function(){
        console.log('sideCtrl.getUser error')
      });

      SidebarService.getOneUser($stateParams.userId).success(function(data){
      sideCtrl.getOneUser = data;
      })
      .error(function(){
        console.log('ERROR sideCtrl.getOneArticle')
      });

      newsCtrl.routeTo = function (path) {
        $location.path(path);
      };

  });

})();
