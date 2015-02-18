$(document).on('page:change', function(){
  $('.question-card').click(function(){
    if(!$(this).children('.top').children('.options').data('edit'))
      $(this).children('.bottom').children('.question').siblings().slideToggle()
  });

  $('.glyphicon-trash').click(function(e){
    // Prevent card from expanding
    e.stopImmediatePropagation();

    options = $(this).parents('.options');
    if(options.data('delete')){
      options.siblings('.image').fadeTo('fast',1)
      $(this).parents('.top').siblings('.bottom').fadeTo('fast', 1)
      options.data('delete', false)
    } else {
      options.siblings('.image').fadeTo('fast',.7)
      $(this).parents('.top').siblings('.bottom').fadeTo('fast', .7)
      options.data('delete', true)
    }
  });

  $('.glyphicon-floppy-disk').click(function(e){
    options = $(this).parents('.options');
    id = options.data('id');
    if(options.data('delete')){
      $.ajax({
        type: "DELETE",
        url: "/en/questions/" + id + '.json'
      }).success(function(){
        Turbolinks.visit(window.location.href);
      }) 
    } else if(options.data('edit')){
      questionDiv = $(this).parents('.question-card').children('.bottom').children('.question');
      question = questionDiv.children('textarea').val().replace(/(\r\n|\n|\r)/gm,"");
      answerDiv = $(this).parents('.question-card').children('.bottom').children('.answer');
      answer = answerDiv.children('textarea').val().replace(/(\r\n|\n|\r)/gm,"");

      questionDiv.children('textarea').replaceWith($('<p>' + question + '</p>'))
      answerDiv.children('textarea').replaceWith($('<p>' + answer + '</p>'))

      options.data('edit', false)
      $.ajax({
        type: "PATCH",
        url: "/en/questions/" + id + '.json',
        data: "question[answer]=" + answer + "&question[question]=" + question 
      })
    }
    // Prevent card from expanding
    e.stopImmediatePropagation();
  });

  $('.glyphicon-pencil').click(function(e){
    options = $(this).parents('.options');
    question = $(this).parents('.question-card').children('.bottom').children('.question').children('p')
    answerDiv = $(this).parents('.question-card').children('.bottom').children('.answer')
    answer = answerDiv.children('p')
    question.replaceWith($('<textarea>' + question.text().trim() + '</textarea>'));
    answer.replaceWith($('<textarea>' + answer.text().trim() + '</textarea>'));
    answerDiv.slideDown();
    answerDiv.children('textarea').autosize();
    options.data('edit', true)
  })
});
