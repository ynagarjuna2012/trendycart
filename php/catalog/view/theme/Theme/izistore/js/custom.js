$(function(){
	//My Account Links
	$('#topBar #welcome').mouseenter(function(){
		$('.links').show();
	}).mouseleave(function(){
		$('.links').hide();
	});
});

$(function(){
	//Search
	var searchInput = $('#search input');
	var value = searchInput.val();
	searchInput.click(function(){		
			$(this).val('');
	});
	searchInput.blur(function(){
		if($(this).val() == ""){
				$(this).val(value);
		}
	});
	/* Search */
	$('#search .button-search,.newSearch #search .button-search').bind('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
				 
		var filter_name = $(this).parent('div').find('input[name=\'filter_name\']').attr('value');
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
		
		location = url;
	});
	
	$('#search input[name=\'filter_name\'],.newSearch #search input[name=\'filter_name\']').bind('keydown', function(e) {
		if (e.keyCode == 13) {
			url = $('base').attr('href') + 'index.php?route=product/search';
			 
			var filter_name = $(this).attr('value');
			
			if (filter_name) {
				url += '&filter_name=' + encodeURIComponent(filter_name);
			}
			
			location = url;
		}
	});
});

$(function(){
	//Image Hover Fade
	$('#logo img, .box-product img, .image img,.image-additional img').hover(function(){
		this.check = this.check || 1;
		$(this).stop().fadeTo('slow',this.check++%2==0 ? 1 : 0.7);
	});
});

$(function(){
	//Slideshow & Carousel Button
	$(window).load(function() {
		function top(cName,outer){
		$(cName).css({
			top: ($(outer).height() - $(cName).outerHeight())/2
		});	
		}
		top('.prevNext li','.slideshow');
		top('.prevNext2 li a','.box-special');			
	});
});

$(function(){
	//Toggle Sub Categories
	var activeCat = '.box-category ul li a.active';
	if($(activeCat).length > 0){
		$(activeCat).parent('li').find('ul').show();	
		$(activeCat).parent('li').find('a.toggle').toggleClass('aToggle');		
	}	
	$('.subcat a').click(function(){
		$('.subcat a').removeClass('aToggle');
		var ul = $(this).parent('div').parent('li').find('ul');
		if(!ul.is(':visible')){
			$('.box-category ul li > ul').slideUp();
			$(this).toggleClass('aToggle');
		}else{			
			$(this).removeClass('aToggle');
		}
		ul.stop(true,true).slideToggle();
	});
});

$(function(){
	//Bestsellers	
	var elem = '#column-left .bestContent,#column-right .bestContent'
	$(elem).hide();
	var prodTitle = '#column-left .bestsellers .name a,#column-right .bestsellers .name a';
	$(prodTitle).first().addClass('active')
					 .closest('li').find('.bestContent').show();					 
	$('#column-left .bestsellers li,#column-right .bestsellers li').mouseenter(function(){
		if(!$(this).find('.bestContent').is(':visible')){
			$('#column-left .bestsellers .name a,#column-right .bestsellers .name a').removeClass('active');
			$(elem).stop(true,true).slideUp();
			$(this).find('.name a').addClass('active');
			$(this).find('.bestContent').stop(true,true).slideDown();
		}
	})		
});

$(function(){
	//Grid List Category View
	if ($(".display ul li").length > 0){
		$(".display ul li").click(function(){
			$(".display ul li a").removeClass("active");
			$(this).find("a").addClass("active");
			var cName = $(this).hasClass("list");
			if(cName){
				$("#cat-products").removeClass("prod-grid").addClass("prod-list");	
				$.cookie('display', 'list');
			}else{
				$("#cat-products").removeClass("prod-list").addClass("prod-grid");	
				$.cookie('display', 'grid');
			}		
		});
		function display(view) {
			if (view == 'list') {
				$("#cat-products").removeClass("prod-grid").addClass("prod-list");	
				$(".display ul li.grid a").removeClass("active");
				$(".display ul li.list a").addClass("active");
			}else{
				$("#cat-products").removeClass("prod-list").addClass("prod-grid");
			}
		}
		view = $.cookie('display');
		if (view) {
			display(view);
		} else {
			display('grid');
		}
		$(window).load(function() {
			if(view=='grid'){
				$('#content .box-product').each(function(){
					var ulHeight = $(this).height();	
					$(this).find('li').css('height',ulHeight-21+'px');
				});
			}
		});
		$('li.grid').click(function(){
			$('#content .prod-grid ul').each(function(){
					var ulHeight = $(this).height();	
					$(this).find('li').css('height',ulHeight-21+'px');
			});
		});
	}
});


$(function(){
	//Swap images
	$('.image-additional a').mouseenter(function(){
		var imgHref = $(this).attr('href');
		var imgWidth = $('.product-info .image img').width();
		var imgHeight = $('.product-info .image').height();
		
		$('.product-info .image').css('height',imgHeight+'px','width',imgWidth+'#');			
		$('.product-info .left .image a').attr({href: imgHref});
		$('.product-info .left .image img').attr({src: imgHref}).css('width',imgWidth)
		.bind('onreadystatechange load', function(){
			 if (!this.complete){
				  $('.product-info .left .image').append('<p class="load">loading...</p>');
			 }
      });
	});
});

$(function(){
/* Ajax Cart */
	$('#cart > .heading a').live('click', function() {
		$('#cart').addClass('active');
		$('#cart .content').hide().fadeIn('slow');
		$('#notification').hide();
		$('#cart').load('index.php?route=module/cart #cart > *');
		
		$('#cart a.closeCart').live('click', function() {
			$('#cart .content').fadeOut('slow');
		});
	});
});

/* Default OC Code */
/* Mega Menu */
$(function(){
	$('#menu ul > li > a + div').each(function(index, element) {
		// IE6 & IE7 Fixes
		if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 6)) {
			var category = $(element).find('a');
			var columns = $(element).find('ul').length;
			
			$(element).css('width', (columns * 143) + 'px');
			$(element).find('ul').css('float', 'left');
		}		
		
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();
		
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
		
		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});
});

$('.success img, .warning img, .attention img, .information img').live('click', function() {
		$(this).parent().fadeOut('slow', function() {
			$(this).remove();
		});
});	

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			}
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#cart-total').html(json['total']);
				
				$('#notification').show();
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
					$('span.close').click(function(){
						$('#notification').fadeOut();
					});
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#wishlist-total').html(json['total']);
				$('#notification').show();
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				$('span.close').click(function(){
						$('#notification').fadeOut();
					});
			}	
		}
	});
}

function addToCompare(product_id) { 
	$.ajax({
		url: 'index.php?route=product/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
						
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<span class="close"></span></div>');
				
				$('.success').fadeIn('slow');
				
				$('#compare-total').html(json['total']);
				$('#notification').show();
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				$('span.close').click(function(){
						$('#notification').fadeOut();
					});
				
			}	
		}
	});
}