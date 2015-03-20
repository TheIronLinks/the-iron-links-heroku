(function () {
    'use strict';
    angular.module('tilAPP')

//=====================STORING CARD DIRECTIVE IN ROOTSCOPE=====================

      .run(['$rootScope', function($rootScope){

        $rootScope.card_directive_tmpl = {
          restrict: 'E',
          scope: {
            data: '=',
            action: '&'
          },
          templateUrl: '',
          link: function(scope, element, attrs) {

            element.find('li[data-trait=\'1\']').attr('data-state', 'selected');

            element.find('li[data-trait=\'2\'],li[data-trait=\'3\'],li[data-trait=\'4\']').addClass('invis');

            //=====================CARD SLIDER FUNCTIONALITY=====================

            element.find('.fa.fa-5x.fa-caret-left,.fa.fa-5x.fa-caret-right').on('click',function(){
              var comingFrom = element.find('li[data-state=\'selected\']').data('trait');
              var goingTo;
              if($(this).attr('rel') === 'left'){
                if(comingFrom === 1){
                  goingTo = 4;
                }else{
                  goingTo = comingFrom - 1;
                }
              }else if($(this).attr('rel') === 'right'){
                if(comingFrom === 4){
                  goingTo = 1;
                }else{
                  goingTo = comingFrom + 1;
                }
              }
              element.find('li[data-state=\'selected\']').addClass('invis');
              element.find('li[data-state=\'selected\']').attr('data-state', comingFrom);
              element.find('li[data-trait='+goingTo+']').removeClass('invis');
              element.find('li[data-trait='+goingTo+']').attr('data-state', 'selected');
            });

            //=====================UNSPREAD CARD=====================

            element.find('li').on('click',function(){
              var comingFrom = element.find('li[data-state=\'selected\']').data('trait');
              var goingTo = $(this).closest('li').data('trait');
              element.find('li').addClass('invis');
              element.find('li[data-state=\'selected\']').attr('data-state', comingFrom);
              element.find('li[data-trait='+goingTo+']').attr('data-state', 'selected');
              element.find('li[data-trait='+goingTo+']').removeClass('invis');

              element.find('li').removeClass('cardSpreadOne cardSpreadTwo cardSpreadThree cardSpreadFour');
              element.find('ul').removeClass('cardSpreadStack');
              element.find('li').css({'cursor':'auto'});
              element.find('.fa.fa-lg,.fa.fa-2x,.fa.fa-5x').css({'display':'inline-block'});
            });

            //=====================SPREAD CARD=====================

            element.find('.fa.fa-2x.fa-ellipsis-v').on('click',function(event){
              event.stopPropagation();
              console.log('firing spread');
              var firstCard = $(this).parent().data('trait');
              if(firstCard === 1){
                var secondCard = 2;
                var thirdCard = 3;
                var fourthCard = 4;
              }else if(firstCard === 2){
                var secondCard = 3;
                var thirdCard = 4;
                var fourthCard = 1;
              }else if(firstCard === 3){
                var secondCard = 4;
                var thirdCard = 1;
                var fourthCard = 2;
              }else if(firstCard === 4){
                var secondCard = 1;
                var thirdCard = 2;
                var fourthCard = 3;
              }
              element.find('li[data-trait='+firstCard+']').addClass('cardSpreadOne');
              element.find('li[data-trait='+secondCard+']').addClass('cardSpreadTwo');
              element.find('li[data-trait='+thirdCard+']').addClass('cardSpreadThree');
              element.find('li[data-trait='+fourthCard+']').addClass('cardSpreadFour');
              element.find('ul').addClass('cardSpreadStack');
              element.find('li').removeClass('invis');
              element.find('.fa.fa-lg,.fa.fa-2x,.fa.fa-5x').css({'display':'none'});
              element.find('li').css({'cursor':'pointer'});

            });

            //=====================CARD DETAIL FUNCTIONALITY=====================

            element.find('.fa.fa-lg.fa-flip-horizontal.fa-expand').on('click',function(){
              element.find('ul')
                .css({
                  'position':'static',
                  'top':'50px',
                  'height':'60vh'
                });
            });

            }
          };
      }])

//=====================GRAD CARD DIRECTIVE=====================

      .directive('gradCardDirective', function($location, $rootScope) {
        var return_object = $rootScope.card_directive_tmpl;
        return_object.templateUrl = 'assets/directiveTemplates/cardStack.graduate.directive.html';
        return return_object;
      })
//=====================EMPL CARD DIRECTIVE=====================

      .directive('emplCardDirective', function($location, $rootScope) {
        var return_object = $rootScope.card_directive_tmpl;
        return_object.templateUrl = 'assets/directiveTemplates/cardStack.employer.directive.html';
        return return_object;
      })
//=====================JOB CARD DIRECTIVE=====================

      .directive('jobCardDirective', function($location, $rootScope) {
        var return_object = $rootScope.card_directive_tmpl;
        return_object.templateUrl = 'assets/directiveTemplates/cardStack.job.directive.html';
        return return_object;
      })



        //=====================LOADING TEMPLATEURL BASED ON ROUTE=====================

        // $rootScope.$on("$routeChangeStart", function(){
        //   if($location.path() === '/graduates'){
        //     returnObject.templateUrl = 'assets/directiveTemplates/cardStack.graduate.directive.html';
        //     console.log('gradroute');
        //   }else if($location.path() === '/employers'){
        //     returnObject.templateUrl = 'assets/directiveTemplates/cardStack.employer.directive.html';
        //     console.log('emplroute');
        //   }else if($location.path() === '/jobs'){
        //     returnObject.templateUrl = 'assets/directiveTemplates/cardStack.job.directive.html';
        //     console.log('jobroute');
        //   }
        // });
        // $rootScope.$on("$viewContentLoaded", function(){
        //   if($location.path() === '/graduates'){
        //     returnObject.templateUrl = 'assets/directiveTemplates/cardStack.graduate.directive.html';
        //     console.log('gradload');
        //   }else if($location.path() === '/employers'){
        //     returnObject.templateUrl = 'assets/directiveTemplates/cardStack.employer.directive.html';
        //     console.log('emplload');
        //   }else if($location.path() === '/jobs'){
        //     returnObject.templateUrl = 'assets/directiveTemplates/cardStack.job.directive.html';
        //     console.log('jobload');
        //   }
        // });
        // return returnObject;
    //})

//=====================SEARCH DIRECTIVE=====================

    .directive('searchDirective', function($location, $rootScope) {
      var returnObject = {
        restrict: 'E',
        scope: {
          data: '='
        },
        templateUrl: '',
        link: function(scope, element, attrs) {

          //=====================TOGGLE SEARCH FORMS TO MATCH ROUTE=====================

  //         $rootScope.$on("$routeChangeStart", function(){
  //           element.find('.search-form').addClass('invis');
  //           if($location.path() === '/graduates'){
  //             element.find('.search-graduates-form').removeClass('invis');
  //           }else if($location.path() === '/employers'){
  //             element.find('.search-employers-form').removeClass('invis');
  //           }else if($location.path() === '/jobs'){
  //             element.find('.search-jobs-form').removeClass('invis');
  //           }
  //         });
  //         $rootScope.$on('$viewContentLoaded', function(){
  //           element.find('.search-form').addClass('invis');
  //           if($location.path() === '/graduates'){
  //             element.find('.search-graduates-form').removeClass('invis');
  //           }else if($location.path() === '/employers'){
  //             element.find('.search-employers-form').removeClass('invis');
  //           }else if($location.path() === '/jobs'){
  //             element.find('.search-jobs-form').removeClass('invis');
  //           }
  // });

        }
      };

      //=====================LOADING TEMPLATEURL BASED ON USER TYPE=====================

      // if(Auth._currentUser.account_type === 'student'){
      //   returnObject.templateUrl = 'assets/views/offCanvasSearch/graduateUserSearch.html'
      // }else if(Auth._currentUser.account_type === 'employer'){
      //
      // }
      returnObject.templateUrl = 'assets/directiveTemplates/graduateUserSearch.directive.html'
      return returnObject;
  });




})();
