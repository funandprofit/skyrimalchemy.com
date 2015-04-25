$(function(){
  $('.tooltip').qtip({
    position: {
      adjust: {
        x: 7,
        y: 0,
        screen: true
      },
      my: 'left center',
      at: 'right center',
      target: '.ingredient-list li'
    },
    adjust: {
      // mouse: true
    },
    hide: {
      delay: 100,
      fixed: true
    },
    show: {
      effect: false,
      delay: 275
    },
    style: {
      classes: 'ui-tooltip-skyrim'
    }
  });
})
