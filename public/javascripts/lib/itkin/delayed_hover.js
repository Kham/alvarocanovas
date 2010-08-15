(function($){
  var wrapOnMouseOver = function(onMouseOver){
    return function(){
      $this = $(this);
      clearTimeout($this.data('delayedHoverTimeout'));
      onMouseOver(this);
    }
  }
  var wrapOnMouseOut = function(onMouseout,delay){
    return function(){
      $this = $(this);
      $this.data('delayedHoverTimeout', setTimeout(function(){onMouseout($this)},delay));
    }
  }

  $.fn.delayedHover = function(onMouseOver,onMouseOut,time){
    $this = $(this);
    //$this.data('delayedHoverTimeout',null);
    $this.hover(wrapOnMouseOver(onMouseOver), wrapOnMouseOut(onMouseOut || onMouseOver, time));
  }
})(jQuery)


