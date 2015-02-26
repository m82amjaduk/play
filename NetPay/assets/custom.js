$(document).ready(function(){

	var title = $('.title');
	title.nextUntil('.title').not('.send').hide();
	title.on('click' , function(){
		$(this).nextUntil('.title').not('.send').toggle();
	});
	
	$('.showall').on('click' , function(){
		var ths = $(this);
		var thsText = ths.text();		
		if( thsText.indexOf('+') > 0 ){
			ths.children('td').text('- Hide all');
			ths.nextUntil('.sens').not('.title, .send').show();
		}else{
			ths.children('td').text('+ Show all');
			ths.nextUntil('.sens').not('.title, .send').hide();
		}		
	});
});