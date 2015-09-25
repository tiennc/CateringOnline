$(document).ready(function() {		
    var s = $("#sticker");
    var pos = s.position(); 
    var end  = $("#mainbottom").position(); 
    var wh = $(window).height();
    
    $("#hfMobileMenu").click(function(){		
		$("body").toggleClass("mobile-toggle");
	});	
	$(document).mouseup(function (e){
		var container = $('#globalMenuMobile');
		if (!container.is(e.target)&& container.has(e.target).length === 0){
			$("body").removeClass('mobile-toggle');
		}
	});	
	$(document).on("mousedown touchstart",function(e){
	  var $info = $('#globalMenuMobile');
	  if (!$info.is(e.target) && $info.has(e.target).length === 0) {
	    $("body").removeClass('mobile-toggle');
	  }
	});
		    
    $(window).scroll(function() {
        var windowpos = $(window).scrollTop();       
        if (windowpos >= pos.top && windowpos < (end.top-wh)) {
           // s.addClass("sticky");            
        } else{
           // s.removeClass("sticky");            
        }       
    });
    
    $(".hidefilter").click(function(){    	
    	$("#maincontent").toggleClass("hasSidebar hasW200");
    	$("#sidebar").toggleClass("nodisplay");
    	$("ul#itemslist").toggleClass("col4");
    	
    	$(this).toggleClass("less");
		if($(this).hasClass("less")){
			$(this).html("Hi&#7879;n b&#7887; l&#7885;c");
		}else{
			$(this).html("&#7848;n b&#7897; l&#7885;c")
		}    	
    });
    
    $(".sortbyme").click(function(){
    	$title = $(this).attr("title");
    	$("a.sortby").html($title);
    });
    
    $('#tgndSlider').slider({});
    
    $("a.thumbpreview").click(function(){
    	$src = $(this).attr("data-view");
    	$("img#mainpreview").attr("src",$src);
    });

    $("#add_new_list_link").click(function(){
    	$namecat = $("#newCategoryNeedLater").val();
    	$currentnumber = $("#groupCategoryNeedLater input[type='checkbox']").length;
    	$nextnumber = $currentnumber + 1;   	
    	$("#groupCategoryNeedLater input[type='checkbox']").attr('checked', false);
    	$("#groupCategoryNeedLater").append("<div class='checkbox' data-number='"+$nextnumber+"'><label><input type='checkbox' checked>"+$namecat+"</label><a class='removethiscat' href='javascript:delfoder("+$nextnumber+");'>Loại bỏ danh sách này</a></div>");
    });
});

function delfoder($number){	
	$("#groupCategoryNeedLater div.checkbox[data-number='"+$number+"']").remove();
}
