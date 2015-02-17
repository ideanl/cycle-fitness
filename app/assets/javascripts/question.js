$(document).on('page:change', function(){
  $('.question-card').click(function(){
    $(this).children('.bottom').children('.question').siblings().slideToggle()
  });
});
