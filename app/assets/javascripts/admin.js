function utc_to_local() {

  $('.utc').each(function(){
    $this = $(this);
    $this.text(moment().utc($this.text()).format('MMMM Do YYYY, h:mm:ss a'));
    $this.removeClass('utc');
  });

}

$(function(){
  utc_to_local();
});