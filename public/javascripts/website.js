$(function(){

  $('#menu').mainMenu();
  $('.category_pictures').live('click',function(){
    $('#content').clearQueue();
  });
  $("#thumbs").livequery(function(){
    $(this).gallery('classic');
  });

});

