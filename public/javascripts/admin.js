
var AdminList = {
//  setup: function(){
//
//    AdminList.makeSortable('#tab-0 #categories', function(eltId){
//      return '/admin/categories/reorder'
//    });
//
//    AdminList.makeSortable('#ui-tabs-1 .pictures.sortable', function(eltId){
//      return '/admin/categories/' + eltId + '/pictures/reorder'
//    });
//
//
//
//  },
  
  makeSortable: function($elt, ajaxUrl){
    $elt.sortable({
      axis:'y',
      containment:'parent',
      forcePlaceholderSize: true,
      items:'>li',
      update:function(evt,ui){
        $.get(ajaxUrl(this.id.match(/\d+/)),
          {
            ordered_ids: $.map($(this).children(), function(elt) {
              return elt.id.match(/\d+/)
            })
          }
        );
      }
    });
    
  }

}



$(function(){

  
  ajaxMulitipartForm.setup();

  $('textarea').livequery(
    function(){
      $(this).tinymce({
        mode:'textarea',
        theme : "advanced",
        plugins : "advlink",
        theme_advanced_buttons1: "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,undo,redo,|,link,unlink,anchor",
        theme_advanced_buttons2: '',
        theme_advanced_buttons3: '',
        theme_advanced_buttons4: '',
        theme_advanced_toolbar_location: 'top'
      })
    }
  );

  

  $("#tabs").tabs();

  $('#ui-tabs-1 .categories').livequery(
    function(){
      $(this).accordion({
        header:'.header',
        active: false,
        autoHeight: false,
        alwaysOpen: false,
        collapsible: true
      });
      $('#ui-tabs-1 .categories').children().removeClass("ui-state-default");
    },
    function(){
      $(this).accordion('destroy')
    }
  );
  $('ul.ui-sortable li').livequery(function(){
    $(this).prepend('<span class="ui-icon ui-icon-arrowthick-2-n-s"></span>')
  });
  
  $('#tab-0 #categories').livequery(
    function(){
      AdminList.makeSortable($(this), function(eltId){
        return '/admin/categories/reorder'
      })
    },
    function(){
      $(this).sortable('destroy');
    }
  );

  $('#ui-tabs-1 .pictures.sortable').livequery(
    function(){
      AdminList.makeSortable($(this), function(eltId){
        return '/admin/categories/' + eltId + '/pictures/reorder'
      })
    },
    function(){
      $(this).sortable('destroy');
    }
  );
  



  



});