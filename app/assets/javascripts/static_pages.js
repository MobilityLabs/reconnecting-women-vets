// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var steps = ['one','two','three', 'four', 'five'];

$(function(){
  $('.' + steps[0]).show();
  $.each(steps, function(index, step){
    $('.' + step).find('.btn').click(function(e){
      $('#privacy-notice').hide();
      $('.question-demo').hide();
      $('.like-you').hide();
      $('.' + steps[index + 1]).show();
    });
  });
});