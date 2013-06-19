$(function(){
  $('button#add_question').click(function(){
    var $q = $('.question.template').clone().removeClass('template');
    $q.find('button.remove_question').click(function(e){
      $(e.target).parents('.question').remove();
    });
    $q.appendTo('#questions');
  });
});
