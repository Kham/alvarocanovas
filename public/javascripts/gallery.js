var Gallery = {

  onMouseOutOpacity: 0.4,

  classic: {
    delay:                     5000,
    numThumbs:                 9,
    preloadAhead:              15,
    enableTopPager:            false,
    enableBottomPager:         false,
    imageContainerSel:         '#slideshow',
    controlsContainerSel:      '#slideShowControls',
    captionContainerSel:       '#slideShowCaption',
    loadingContainerSel:       '#loading',
    renderSSControls:          true,
    renderNavControls:         false,
    playLinkText:              'Play',
    pauseLinkText:             'Pause',
    prevLinkText:              '&lsaquo; Previous Photo',
    nextLinkText:              'Next Photo &rsaquo;',
    nextPageLinkText:          'Next &rsaquo;',
    prevPageLinkText:          '&lsaquo; Prev',
    enableHistory:             false,
    autoStart:                 true,
    syncTransitions:           true,
    defaultTransitionDuration: 900,

    onSlideChange: function(prevIndex, nextIndex) {
      // 'this' refers to the gallery, which is an extension of $('#thumbs')
      this.find('ul.thumbs').children()
        .eq(prevIndex).fadeTo('fast', Gallery.onMouseOutOpacity).end()
        .eq(nextIndex).fadeTo('fast', 1.0);

      // Update the photo index display
      this.$captionContainer
        .html( (nextIndex+1) +' / '+ this.data.length);
    },
    onPageTransitionOut: function(callback) {
      //this.animate({left:}
      this.fadeTo('fast', 0.0, callback);

    },
    onPageTransitionIn: function(positionHandler) {
      var prevPageLink = this.find('a.prev').css('visibility', 'hidden');
      var nextPageLink = this.find('a.next').css('visibility', 'hidden');

      // Show appropriate next / prev page links
      if (this.displayedPage > 0)
        prevPageLink.css('visibility', 'visible');

      var lastPage = this.getNumPages() - 1;
      if (this.displayedPage < lastPage)
        nextPageLink.css('visibility', 'visible');

      this.fadeTo('fast', 1.0);
    }
  }

};



(function($){
  $.fn.gallery = function(thema, options){

    // Initially set opacity on thumbs and add
    // additional styling for hover effect on thumbs
    $('#thumbs ul.thumbs li, div.navigation a.pageLink').opacityrollover({
      mouseOutOpacity:   Gallery.onMouseOutOpacity,
      mouseOverOpacity:  1.0,
      fadeSpeed:         'fast',
      exemptionSelector: '.selected'
    });

    gallery = this.galleriffic($.extend({},Gallery[thema],options))

    /**************** Event handlers for custom next / prev page links **********************/

    $('#thumbs a.prev').live('click',function(e) {
      gallery.previousPage();
      e.preventDefault();
    });

    $('#thumbs a.next').live('click',function(e) {
      gallery.nextPage();
      e.preventDefault();
    });
    $('a#fullScreen').click(function(e){
      alert('launch other slideshow');
      e.preventDefault();
    })

    $('#gallery .slideLink').hover(
      function(){
        $(this).fadeTo('fast',0.4)
      },
      function(){
        $(this).fadeTo('fast',0)
      }
    );

    $('#gallery .slideLink.next').click(function(e){
      gallery.next();
      e.preventDefault();
    })
    $('#gallery .slideLink.prev').click(function(e){
      gallery.previous();
      e.preventDefault();
    })

    $('#gallery #thumbs-wrapper').hover(
      function(){
        $("#thumbs-hidder")
          .animate({height:"1px"})
          .find('span')
          .fadeOut('fast');

      },
      function(){
        $("#thumbs-hidder")
          .animate({height:"100%"})
          .find('span')
          .fadeIn('slow');
      }
    );

  }
})(jQuery);
