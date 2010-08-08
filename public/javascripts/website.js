$(function(){

  // Initialisation menu principal
  $('#menu').mainMenu();

  // Accès direct a une gallery depuis la page categories/:id/show
  $('.category_pictures').live('click',function(){
    $('#content').clearQueue();
  });

  // Initialization du sous menu des categories
  $('.category.menu').livequery(
    function(){
      $(this).find('ul').css('display','none');
      $(this).hover(
        function(){
          $(this).children('ul').slideDown();
        },
        function(){
          $(this).children('ul').slideUp();
        }
      );
    }
  );

  // Initilisation des galleries
  $("#thumbs").livequery(function(){
    $(this).gallery('classic');
  });

});

