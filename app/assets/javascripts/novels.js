//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
//  $('.best_in_place').best_in_place();
  
  
   $(function() {
      $( "#scenes" ).sortable();
      $( "#scenes" ).disableSelection();
      $( "#scenes" ).on("sortupdate" , function(e){ 
        console.log($("#scenes").sortable("serialize"));
        $.ajax({
          url: "/scenes/sort",
          type: "POST",
          data:$('#scenes').sortable('serialize')
        });// end ajax
          
      
      });//end function
    });//end on document ready.