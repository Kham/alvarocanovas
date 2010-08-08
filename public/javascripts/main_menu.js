(function($){
  
  var opt = {
    topBefore: '20px',
    topAfter: '55px'
  };

  $.fn.mainMenu = function(){
    this.find('ul').hide();
    $.extend(this, instanceFunctions);

    $menu = this

    //Animate subMenus
    $menu.find('ul>li').hover(
      function(){
        $(this).find('ul').fadeIn();
      },
      function(){
        $(this).find('ul').fadeOut();
      }
    );

    //Animate MainMenu
    $menu.hover(
      function(){
        $menu.scrollDown()
      },
      function(){
        $menu.scrollUp()
      }
    );

    return this
  }

  var instanceFunctions = {
    scrollDown: function(){
      $menu = this ;
      $menu.find('h2')
        .animate({top: opt.topAfter}, function(){
          $menu.find('>ul').fadeIn();
      });
      $menu.find('h2 span').fadeOut();
    },
    scrollUp: function(){
      $menu = this;
      $menu.find('h2')
       .animate({top: opt.topBefore},
        function(){
          $menu.find('>ul').fadeOut('fast');
        }
      );
      $menu.find('>ul').fadeOut();
      $menu.find('h2 span').fadeIn('slow');
    }
  }

})(jQuery);