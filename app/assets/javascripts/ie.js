$(document).ready(function() {
  if (!Turbolinks.supported) {
    $(document).trigger('page:change');
    $(document).trigger('page:load');
    $(document).trigger('page:update');
  }
});
