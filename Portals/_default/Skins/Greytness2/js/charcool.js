$(document).ready(function(){

	$(".Level0 li").hover(
		function() {
			$(this).find(".Level1").stop(true, true).fadeIn();
		},
		function() {
			$(this).find(".Level1").stop(true, true).fadeOut()
		}
	);
	
	$(".Level1 li").hover(
		function() {
			$(this).find(".Level2").stop(true, true).fadeIn();
		},
		function() {
			$(this).find(".Level2").stop(true, true).fadeOut()
		}
   );
   
   $(".Level2 li").hover(
		function() {
			$(this).find(".Level3").stop(true, true).fadeIn();
		},
		function() {
			$(this).find(".Level3").stop(true, true).fadeOut()
		}
   );
   
   $(".Level3 li").hover(
		function() {
			$(this).find(".Level4").stop(true, true).fadeIn();
		},
		function() {
			$(this).find(".Level4").stop(true, true).fadeOut()
		}
   );
	
});