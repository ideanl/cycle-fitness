$(document).on('ready page:change', function() {
  $('#locale').on('change', function() {
    pathname = window.location.pathname;
    value = $('#locale').val();

    pathname = pathname.replace('/' + $('body').data('locale'), '')
    pathname = "/" + value + pathname;
    window.location.pathname = pathname;
  });
});
