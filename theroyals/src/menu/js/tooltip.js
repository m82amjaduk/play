                    
          $.fn.tooltip = function () {
          
            var tTclass = $('a.tooltip');
                
            
            
            
            tTclass.on('mouseenter', function(){
              var tip = $(this).data('tip'),
                  anchorWidth = $(this).width(),
                
                anchorWidth = anchorWidth / 2;
                                
                
                if ( $(this).find('div.tooltipShow').length == 1 ) {
                                                    
                  $(this).find('div.tooltipShow').slideDown(200);                                                     
                }
                else {                
                  var createToolTip = $('<div/>', {
                      class: 'tooltipShow',
                      text: tip                     
                  });
                  createToolTip.appendTo($(this)).hide().slideDown(200);
                  
                  var tooltipShow = $('.tooltipShow'),
                      tooltipShowWidth = tooltipShow.width();
                  
                  tooltipShowWidth = tooltipShowWidth / 2;
                  
                  tooltipPosition = anchorWidth - tooltipShowWidth;     
                  
                  tooltipShow.css('right', tooltipPosition);                                                                                                                                                                                                         
                }  
              });
            
            tTclass.on('mouseleave', function(){
              $(this).find('div.tooltipShow').slideUp(200);
            });
            
          }
          