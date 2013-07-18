$(function(){

  $('#answer_end_of_path').click(function(e){
    if ($(e.target).is(':checked'))
      $('#answer_pathway_id').val('');
    $('#goto_pathway.field').toggleClass('hidden');
  });

});