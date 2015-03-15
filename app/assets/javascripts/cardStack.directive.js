(function () {
    "use strict";
    angular.module('cardStackUI')
      .directive('cardDirective', function() {
        return {
          restrict: 'E',
          scope: {
            data: '='
          },
          templateUrl: 'assets/cardStack.directive.html',
          link: function(scope, element, attrs) {
            element.find('li[rel=\'1\']').attr('rel', 'selected');
            element.find('li[rel=\'2\'],li[rel=\'3\'],li[rel=\'4\']').css("display", "none");
            // element.find('li[rel=\'3\']').css("display", "none");
            // element.find('li[rel=\'4\']').css("display", "none");
            // element.find('.fa-expand').on('click', function(){
            //   console.log(indexArray);
            // });
            element.find('.fa.fa-5x.fa-caret-left').on('click',function(){
              var comingFrom = element.find('li[rel=\'selected\']').attr('id');
              var goingTo;
              if(comingFrom === '1'){
                goingTo = '4';
              }else{
                goingTo = parseInt(comingFrom) - 1;
              }
              element.find('li[rel=\'selected\']').css("display", "none");
              element.find('li[rel=\'selected\']').attr('rel', comingFrom);
              element.find('li[rel='+goingTo+']').attr('rel', 'selected');
              element.find('li[rel=\'selected\']').css("display", "inline-block");
            });
            element.find('.fa.fa-5x.fa-caret-right').on('click',function(){
              var comingFrom = element.find('li[rel=\'selected\']').attr('id');
              var goingTo;
              if(comingFrom === '4'){
                goingTo = '1';
              }else{
                goingTo = parseInt(comingFrom) + 1;
              }
              element.find('li[rel=\'selected\']').css("display", "none");
              element.find('li[rel=\'selected\']').attr('rel', comingFrom);
              element.find('li[rel='+goingTo+']').attr('rel', 'selected');
              element.find('li[rel=\'selected\']').css("display", "inline-block");
            });
          }
        };
    });

})();
