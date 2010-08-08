$(function(){

  $('#menu').mainMenu();

  $("#thumbs").livequery(function(){
    $(this).gallery('classic');
  });

});

