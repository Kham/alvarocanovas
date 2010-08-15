var menuTimeout, sideMenuTimeout, ThumbsTimeout;

$(function(){

  // Initialisation menu principal

  $('#menu > ul').css({opacity:0});
  $('#menu').hover(
    function(){
      $(this)
        .clearQueue()
        .queue(function(){
          $this = $(this);
          $this
            .find('h2').animate({top: "60px"})
            .find('span').fadeOut(100);
          $this
            .find('>ul')
            .fadeTo(200,1);
          $this.dequeue();
        });
    },
    function(){
     $(this)
      .delay(2000)
      .queue(function(){
        $(this)
          .find('h2').animate({top: "20px"})
          .find('span').fadeIn(100);
        $(this)
          .find('>ul')
          .fadeTo(200,0);
        $(this).dequeue()
      })
    }
  );


  $('#menu ul ul').hide();
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
          $(this).clearQueue();
          $(this).queue(function(){
            $(this).find('ul').slideDown();
            $(this).dequeue();
          });
        },
        function(){
          $(this)
            .delay(2000)
            .queue(function(){
              $(this).find('ul').slideUp();
              $(this).dequeue();
            })
        }
      );
    }
  );

  // Initilisation des galleries
  $("#thumbs").livequery(function(){
    $(this).gallery('classic',{ autoStart: ($(this).find('img').size() > 1) ? true : false });
  });

});

