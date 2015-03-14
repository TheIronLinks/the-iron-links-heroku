(function () {
    "use strict";
    angular.module('cardStackUI')
      .controller('CardController', function () {
        this.stack = [
          {
            name:'Adam',
            title:'this is a title'
          },
          {
            name:'Adamson',
            title:'this is a title'
          },
          {
            name:'Adan',
            title:'this is a title'
          },
          {
            name:'Adrian',
            title:'this is a title'
          },
          {
            name:'Adams',
            title:'this is a title'
          },
          {
            name:'Adriana',
            title:'this is a title'
          }
        ]
      });
})();
