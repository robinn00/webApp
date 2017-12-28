$(function() {
	$("#slider").draggable({
		axis: 'x',
		containment: 'parent',
		drag: function(event, ui) {
			if (ui.position.left > 550) {
				$("#well").fadeOut();				
			}
		},
		stop: function(event, ui) {
			if (ui.position.left < 551) {
				$(this).animate({
					left: 0
				})
			}
			
		}
	});	
		
	$('#slider')[0].addEventListener('touchmove', function(event) {
	    event.preventDefault();
	    var el = event.target;
	    var touch = event.touches[0];
	    curX = touch.pageX - this.offsetLeft - 73;
	    if(curX <= 0) return;
	    if(curX > 550){
	    	$('#well').fadeOut();
			window.location.href="http://3g.ccddzyy.com";
	    }
	   	el.style.webkitTransform = 'translateX(' + curX + 'px)'; 
		
	}, false);
	
	$('#slider')[0].addEventListener('touchend', function(event) {	
	    this.style.webkitTransition = '-webkit-transform 0.3s ease-in';
	    this.addEventListener( 'webkitTransitionEnd', function( event ) { this.style.webkitTransition = 'none'; }, false );
	    this.style.webkitTransform = 'translateX(0px)';
		
	}, false);

});