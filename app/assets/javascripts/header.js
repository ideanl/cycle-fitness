$(document).on('ready page:change', function() {
  $('.navbar ul li').each(function() {
    if(window.location.pathname == $(this).find('a').attr('href'))
    {
      $(this).addClass("active");
      if ($(this).parents('.dropdown-menu').length) {
        $(this).parents('li').addClass('active');
      }
    }
  });

  if (!$('.navbar li.dropdown').hasClass("active")){
    $('.navbar li.dropdown').hover(function() {
      $(this).addClass("active");
      var dropdown = $(this);
      dropdown.data('hover', true);
      setTimeout(function() {
        if (dropdown.data('hover')) {
          dropdown.find('.dropdown-menu').fadeIn('fast');
        }
      }, 100);
    }, function() {
      $(this).removeClass("active")
      var dropdown = $(this);
      dropdown.data('hover', false);
      setTimeout(function() {
        if (!dropdown.data('hover')) {
          dropdown.find('.dropdown-menu').fadeOut('fast'); 
        }
      }, 100);
    });
  }
});
