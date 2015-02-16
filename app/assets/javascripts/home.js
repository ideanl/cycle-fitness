// Ensure DOM elements have been loaded before trying to access them
$(document).on('page:change', function() {
  index_max = $('.slideshow-img').length - 1
  index = index_max;
  // Switch image every five seconds creating slideshow.
  window.setInterval(function(){
    $('#image' + index).fadeToggle()
    if(index-- == 1)
      index = index_max; 
  },6000);
});
