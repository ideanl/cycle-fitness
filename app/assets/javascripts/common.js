$(document).on('ready page:change', function() {
  $(document).on('click', '.change-image', function(e) {
    $('.image-upload').removeClass('hidden');
    $(this).addClass("hidden");
  });

  $('.image-upload').change(function() {
    if (this.files && this.files[0]) {
      $('#box1').removeClass("col-sm-offset-3");
      $('.form-img-preview').removeClass('hidden');
      var reader = new FileReader();

      reader.onload = function(e) {
        $('.form-img-preview img').attr('src', e.target.result);
      }

      reader.readAsDataURL(this.files[0]);
    }
  });
});
