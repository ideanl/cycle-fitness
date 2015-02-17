// Ensure DOM elements have been loaded before trying to access them
$(document).on('page:change', function() {
  index_max = $('.slideshow-img').length - 1
  index = index_max;
  
  // Switch image every five seconds creating slideshow.
  clearInterval(window.i);

  window.i = window.setInterval(function(){
    if (index > index_max)
      $('[id^=image]').show();

    $('#image' + index).fadeToggle();

    if (index-- == 1)
      index = index_max + 1;

  }, 6000);
});
