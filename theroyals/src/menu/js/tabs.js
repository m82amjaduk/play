

$(document).ready(function(){
    var content = '.tabContent', // Set the holder of each Tab
        linkToTab = $('ul.tabName a'), // Set the link to switch each Tab 
        contentNotFirst = $(content + ':not(:first)'),
        contentFirst = $(content + ':first');
        
	contentNotFirst.hide();
	contentFirst.show();
	
	linkToTab.click(function(){
		stringref = $(this).attr("href").split('#')[1];
		$(content + ':not(#'+stringref+')').slideUp(800);
		linkToTab.removeClass('current');
		$(this).addClass('current');
		if (jQuery.browser.msie && jQuery.browser.version.substr(1,5) == "6.0") {
      $(content + '#' + stringref).slideDown(800);
		}
		else 
			$(content + '#' + stringref).slideDown(800);
		return false;
	});	
});
 
 