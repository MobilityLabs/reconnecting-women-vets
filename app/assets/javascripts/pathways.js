$(function(){
  var increment_sequences = function(val) {
    return function() {
      var $el = $(this),
          id = $el.attr('id'),
          name = $el.attr('name'),
          for_id = $el.attr('for');

      $.each([id, for_id], function(ix, id){
        if (id != undefined) {
          var v = id.match(new RegExp(val+'_\\d+_'))[0],
              va = v.split('_'),
              d = parseInt(va[va.length-2],10) + 1;
          $el.attr('id', id.replace(v, val+'_'+d+'_'));
        }
      });

      if (name != undefined) {
        var v = name.match(new RegExp('\\['+val+'\\]\\[\\d+\\]'))[0],
            va = v.split(']['),
            d = parseInt(va[va.length-1],10) + 1;
        $el.attr('name', name.replace(v, '['+val+']['+d+']'));
      }
    };
  },

  add_answer = function(e){
    var $as = $(e.target).parents('.question').find('.answers'),
        $a = $as.find('.answer.template'),
        $at = $a.clone();

    $at.find('input[id*="answers_attributes"]').each(increment_sequences("answers_attributes"));
    $at.find('label[for*="answers_attributes"]').each(increment_sequences("answers_attributes"));
    $at.find('textarea[id*="answers_attributes"]').each(increment_sequences("answers_attributes"));

    $at.appendTo($as);

    $a.removeClass('template')
      .find('button.remove_answer')
      .click(function(e){
        $(e.target).parents('.answer').remove();
      });
  },

  // Clone the template question to be used as a new template question
  // Update its id and name, and append it to the questions
  // Convert the original template question into a new question,
  //   with a handler for the remove button
  add_question = function(e){
    var $qs = $(e.target).parents('.pathway').find('.questions'),
        $q = $qs.find('.question.template'),
        $qt = $q.clone();

    $qt.find('input[id*="questions_attributes"]').each(increment_sequences("questions_attributes"));
    $qt.find('label[for*="questions_attributes"]').each(increment_sequences("questions_attributes"));
    $qt.find('textarea[id*="questions_attributes"]').each(increment_sequences("questions_attributes"));
    $qt.find('button.add_answer').click(add_answer);

    $qt.appendTo($qs);

    $q.removeClass('template')
      .find('button.remove_question')
      .click(function(e){
        $(e.target).parents('.question').remove();
      });

  };

  $('button.add_question').click(add_question);
  $('button.add_answer').click(add_answer);

  $('#questions-order').sortable({
    cursor: "move",
    update: function(e, ui) {
      $('#pathway_questions_order').val($(e.target).sortable('toArray'));
    }
  });

});
