$(function(){

  // Initialisation menu principal

  $('#menu > ul').css({opacity:0});
  $('#menu').delayedHover(function(elt){
    $this = $(elt);
    $this
      .find('h2').animate({top: "60px"})
      .find('span').fadeOut(100);
    $this
      .find('>ul')
      .animate({opacity:1})
    },
    function(elt){
      $this = $(elt);
      $this
        .find('h2').animate({top: "20px"})
        .find('span').fadeIn(100);
      $this
        .find('>ul')
        .animate({opacity:0})
    },
    2000
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
      $(this).delayedHover(
        function(elt){
          $(elt).find('ul').slideDown();
        },
        function(elt){
          $(elt).find('ul').slideUp();
        },
        2000
      );
    }
  );

  // Initilisation des galleries
  $("#thumbs").livequery(function(){
    $(this).gallery('classic',{ autoStart: ($(this).find('img').size() > 1) ? true : false });
  });

});

