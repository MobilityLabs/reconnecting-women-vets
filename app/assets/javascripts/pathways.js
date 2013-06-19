$(function(){

  // Clone the template question to be used as a new template question
  // Convert the original template question into a new question,
  //   with a handler for the remove button
  // Update the new template's id and name and append it to the questions
  $('button#add_question').click(function(){
    var $q = $('.question.template'),
        $qt = $q.clone(), $qt_id = $qt.attr('id'),
        $qt_input = $qt.find('input'),
        $qt_label = $qt.find('label'),
        seq = $('.question').size();

    $q.removeClass('template').find('button.remove_question').click(function(e){
      $(e.target).parents('.question').remove();
    });

    $qt_input
      .attr('id', 'pathway_questions_attributes_'+seq+'_text')
      .attr('name', 'pathway[questions_attributes]['+seq+'][text]');
    $qt_label.attr('for', $qt_input.attr('id'));
    $qt.appendTo('#questions');
  });
});
