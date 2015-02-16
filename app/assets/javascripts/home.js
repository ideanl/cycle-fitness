// Ensure DOM elements have been loaded before trying to access them
$(document).on('page:change', function() {
  index_max = $('.slideshow-img').length - 1
  index = index_max;
  last_index = 0;

  // Switch image every five seconds creating slideshow.
  window.setInterval(function(){
    $('#image' + last_index).toggle();

    $('#image' + index).fadeToggle();

    last_index = index;
    if(index-- == 0) {
      index = index_max;
    }
  },6000);
});
