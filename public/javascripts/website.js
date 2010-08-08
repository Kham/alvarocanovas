$(function(){

  // Initialisation menu principal
//  $('#menu').mainMenu();
  $('#menu ul').hide();

  $('#menu').hover(
    function(){
      $(this)
        .find('h2').animate({top: "55px"})
        .find('span').fadeOut(100);
      $(this)
        .find('>ul')
        .fadeIn()
    },
    function(){
      $(this)
        .find('h2').animate({top: "20px"})
        .find('span').fadeIn(100);
      $(this)
        .find('>ul')
        .fadeOut()
    }
  );

  // Sous menus du menu principal
  $("#menu li").hover(
    function(){
      $(this).find('>ul').fadeIn('fast')
    },
    function(){
      $(this).find('>ul').fadeOut('fast')
    }
  );

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

