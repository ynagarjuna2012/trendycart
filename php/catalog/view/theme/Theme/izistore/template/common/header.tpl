<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>'. "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
<head>
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<?php
$page = '';
	if(isset($this->request->get['route'])){
		$page = $this->request->get['route']; 
	}
?>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/izistore/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/izistore/stylesheet/flexslider.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/izistore/stylesheet/phone.css" media="only screen and (max-width:320px)" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/izistore/stylesheet/tablet.css" media="only screen and (min-width:321px) and (max-width:768px)" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/theme/izistore/js/custom.js"></script>
<script type="text/javascript" src="catalog/view/theme/izistore/js/flexslider.js"></script>
<script type="text/javascript" src="catalog/view/theme/izistore/js/cycle.js"></script>
<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>

<?php echo $google_analytics; ?>

<?php //IziStore Theme Options ?>
<?php $styles =  $this->config->get('izioptions'); ?>
<style type="text/css">
	<?php if($styles['bgColor']): //Body Background ?>
			body{background:<?php echo '#' . $styles['bgColor']; ?>}
	<?php elseif(!$styles['bgColor'] && $styles['bgImage']):?>
			body{background:url('<?php echo HTTP_IMAGE . $styles['bgImage']; ?>');}
	<?php endif; ?>
	
	<?php if($styles['wrapperColor']): //Main Wrapper ?>
			#wrapper{-webkit-box-shadow:0 0 6px #<?php echo $styles['wrapperColor']; ?>;-moz-box-shadow:0 0 6px #<?php echo $styles['wrapperColor']; ?>;box-shadow:0 0 6px #<?php echo $styles['wrapperColor']; ?>;}
			#topBar{-webkit-box-shadow:0 1px 3px #<?php echo $styles['wrapperColor']; ?>;-moz-box-shadow:0 1px 3px #<?php echo $styles['wrapperColor']; ?>;box-shadow:0 1px 3px #<?php echo $styles['wrapperColor']; ?>;}
	<?php endif; ?>
	
	<?php if($styles['primary']): //Primary Color default pink ?>
			#topBar #welcome a.dropArrow,#topBar #cart .heading > a,.box-special .off,.box-category .subcat a,#content .box .off, #content .prod-grid .off, #content .prod-list .off, #column-right .box .off, #column-left .box .off, #content .product-info .off,#topBar #cart .checkout ul li a.checkoutBtn{background-color:#<?php echo $styles['primary']; ?>;}
			/*Color*/
			.box .box-heading, .welcome h3,.price,ul.slideTabs li.active a,.price span.price-new,#menu > ul > li > a:hover,#menu ul li a:hover, #menu ul li:hover > a, #menu li.active > a,#content h1, #content h2,.required{color:#<?php echo $styles['primary']; ?>}
	<?php endif; ?>
	
	<?php if($styles['secondary']): //Secondary Color default blue ?>
			#topBar #welcome p,ul.slideTabs li.active a.bannerId,#header .button-search,#column-left .name span.best, #column-right .name span.best,#topBar #cart .checkout ul li a.viewBtn{background-color:#<?php echo $styles['secondary']; ?>;}
			/*Color*/
			#topBar #cart .heading > a,#menu > ul > li > a,.price-old, .product-info .price span.old,.box .box-heading span, .welcome h3 span,#footer h3,#menu > ul > li > div > ul > li > a,#topBar #cart h4,.product-info .description span{color:#<?php echo $styles['secondary']; ?>}
	<?php endif; ?>
	
	<?php if($styles['slideTop'] && $styles['slideBottom']): //Slideshow buttons ?>
		#prev2,#next2,.c-prev,.c-next{ /* Blue */
					background: #<?php echo $styles['slideBottom']; ?> !important; /* Old browsers */
					background: -moz-linear-gradient(top,  #<?php echo $styles['slideTop']; ?> 0%, #<?php echo $styles['slideBottom']; ?> 100%) !important; /* FF3.6+ */
					background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#<?php echo $styles['slideTop']; ?>), color-stop(100%,#<?php echo $styles['slideBottom']; ?>)) !important; /* Chrome,Safari4+ */
					background: -webkit-linear-gradient(top,  #<?php echo $styles['slideTop']; ?> 0%,#<?php echo $styles['slideBottom']; ?> 100%) !important; /* Chrome10+,Safari5.1+ */
					background: -o-linear-gradient(top,  #<?php echo $styles['slideTop']; ?> 0%,#<?php echo $styles['slideBottom']; ?> 100%) !important; /* Opera 11.10+ */
					background: -ms-linear-gradient(top,  #<?php echo $styles['slideTop']; ?> 0%,#<?php echo $styles['slideBottom']; ?> 100%) !important; /* IE10+ */
					background: linear-gradient(top,  #<?php echo $styles['slideTop']; ?> 0%,#<?php echo $styles['slideBottom']; ?> 100%) !important; /* W3C */
					border:1px solid #<?php echo $styles['slideBottom']; ?>;
		}
	<?php endif; ?>
	
	<?php if($styles['cartBtnTop'] && $styles['cartBtnBottom']): ?>
		a.button, input.button{
			background: #<?php echo $styles['cartBtnBottom']; ?> !important; /* Old browsers */
					background: -moz-linear-gradient(top,  #<?php echo $styles['cartBtnTop']; ?> 0%, #<?php echo $styles['cartBtnBottom']; ?> 100%) !important; /* FF3.6+ */
					background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#<?php echo $styles['cartBtnTop']; ?>), color-stop(100%,#<?php echo $styles['cartBtnBottom']; ?>)) !important; /* Chrome,Safari4+ */
					background: -webkit-linear-gradient(top,  #<?php echo $styles['cartBtnTop']; ?> 0%,#<?php echo $styles['cartBtnBottom']; ?> 100%) !important; /* Chrome10+,Safari5.1+ */
					background: -o-linear-gradient(top,  #<?php echo $styles['cartBtnTop']; ?> 0%,#<?php echo $styles['cartBtnBottom']; ?> 100%) !important; /* Opera 11.10+ */
					background: -ms-linear-gradient(top,  #<?php echo $styles['cartBtnTop']; ?> 0%,#<?php echo $styles['cartBtnBottom']; ?> 100%) !important; /* IE10+ */
					background: linear-gradient(top,  #<?php echo $styles['cartBtnTop']; ?> 0%,#<?php echo $styles['cartBtnBottom']; ?> 100%) !important; /* W3C */
					border:1px solid #<?php echo $styles['cartBtnBottom']; ?>;text-shadow:0px -1px -2px #<?php echo $styles['cartBtnBottom']; ?>;
		}
	<?php endif; ?>
	
	<?php if($styles['checkoutBtnTopBg'] && $styles['checkoutBtnBottomBg']): ?>
		.buttons .checkout{
			background: #<?php echo $styles['checkoutBtnBottomBg']; ?> !important; /* Old browsers */ /* Pink */
					background: -moz-linear-gradient(top,  #<?php echo $styles['checkoutBtnTopBg']; ?> 0%, #<?php echo $styles['checkoutBtnBottomBg']; ?> 100%) !important; /* FF3.6+ */
					background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#<?php echo $styles['checkoutBtnTopBg']; ?>), color-stop(100%,#<?php echo $styles['checkoutBtnBottomBg']; ?>)) !important; /* Chrome,Safari4+ */
					background: -webkit-linear-gradient(top,  #<?php echo $styles['checkoutBtnTopBg']; ?> 0%,#<?php echo $styles['checkoutBtnBottomBg']; ?> 100%) !important; /* Chrome10+,Safari5.1+ */
					background: -o-linear-gradient(top,  #<?php echo $styles['checkoutBtnTopBg']; ?> 0%,#<?php echo $styles['checkoutBtnBottomBg']; ?> 100%) !important; /* Opera 11.10+ */
					background: -ms-linear-gradient(top,  #<?php echo $styles['checkoutBtnTopBg']; ?> 0%,#<?php echo $styles['checkoutBtnBottomBg']; ?> 100%) !important; /* IE10+ */
					background: linear-gradient(top,  #<?php echo $styles['checkoutBtnTopBg']; ?> 0%,#<?php echo $styles['checkoutBtnBottomBg']; ?>100%) !important; /* W3C */				
					border:1px solid #<?php echo $styles['checkoutBtnBottomBg']; ?>;text-shadow:0px -1px -2px #<?php echo $styles['checkoutBtnBottomBg']; ?>;			
		}
	<?php endif; ?>
	
</style>
<script type="text/javascript">
	var slideSpeed = <?php if($styles['slideSpeed']){echo $styles['slideSpeed']; } else { echo 3000; } ?>;
	var slideAnim = <?php if($styles['slideAnim']){ echo '"' . $styles['slideAnim'] . '"' ; } else { echo '"fade"'; } ?>; 
</script>
</head>
<body <?php 			
	if($page == "common/home" || $page == ''){
		echo 'class="home"';
	}elseif($page == "product/category"){
		$titleName = explode(' ',$title);
		$page = $titleName[0];	
		echo 'class="' . strtolower($page) . " category" . '"';		
	}elseif($page == "product/product"){
		$titleName = explode(' ',$title);
		$page = $titleName[0];	
		echo 'class="' . strtolower($page) . " product_page" . '"';		
	}elseif($page == 'checkout/cart'){
		echo 'class="shopping_cart"';
	}elseif($page == 'product/search'){
		echo 'class="' . "search" . '"';
	}elseif($page == 'product/special'){
		echo 'class="' . "special_offers" . '"';
	}elseif($page == 'information/information'){
		echo 'class="' . "page" . '"';
	}elseif($page !== "common/home"){
		$titleName = explode(' ',$title);
		$page = $titleName[0];	
			if(isset($titleName[1])){
				$page = $titleName[0] . "_" . $titleName[1];
			}
		echo 'class="' . strtolower($page) . '"';				
	}
?>>
<div id="fb-root"></div>
<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>

<div id="container">
<div id="topBar">
	<div class="curlang">
       <?php echo $currency; ?>
       <?php echo $language; ?>
       <div class="clear"></div>
    </div>	
       <div id="miniCart">
         <?php echo $cart; ?>
       </div>

   <div id="welcome">
   		<p><a href="javascript:void(0);" <?php if(!$logged) : ?> class="dropArrow" <?php endif; ?>>
			<?php if(!$logged) : ?>
				<?php echo $this->language->get('text_welcome_guest'); ?>
            <?php else: ?>
           		<?php echo $text_logged; ?>
            <?php endif; ?>
           </a>
        </p>
        <span class="arrow"></span>
   		<ul class="links">
			<?php if (!$logged) { ?>
                <?php echo $text_welcome; ?>
            <?php } ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
            <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
        </ul>
  </div>
  <div class="clear"></div>
</div>
<div id="wrapper">
    <div id="header">
      <?php if ($logo) { ?>
        <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
      <?php } ?>
      <div id="search" class="mainSearch">
        <div class="button-search"></div>
        <?php if ($filter_name) { ?>
            <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
        <?php } else { ?>
            <input type="text" name="filter_name" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#ababab';" />
        <?php } ?>
      </div>
      <ul class="informations">      
          <li <?php if($page == "common/home" || $page == ''){echo 'class="active"';} ?>><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
         
          <?php $informations = $this->model_catalog_information->getInformations(); //Get Information Module           
                foreach($informations as $information): 
          ?>
                 <?php //if($information['information_id']!=5): ?>
         
                <li <?php if($title == $information["title"]){echo "class=\"active\"";}?>><a href="<?php echo $this->url->link('information/information', 'information_id=' . $information["information_id"]); ?>" title="<?php echo $information["title"]; ?>"><?php echo $information["title"]; ?></a></li>
                <?php //endif; ?>
         <?php endforeach; //End Information Module ?>
      </ul>   
      <div class="newSearch">
          <div id="search">
            <div class="button-search"></div>
            <?php if ($filter_name) { ?>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
            <?php } else { ?>
                <input type="text" name="filter_name" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#ababab';" />
            <?php } ?>
          </div>
          <?php if ($categories) { ?>
            <div id="selectMenu">
              <select onchange="location = this.options[this.selectedIndex].value;">
              	<option><?php echo $this->language->get('text_browse'); ?></option>
                <?php foreach ($categories as $category) { ?>
                <option value="<?php echo $category['href']; ?>" <?php if($title==$category["name"]){echo 'selected="selected"';}?>><?php echo $category['name']; ?></option>
                  <?php if ($category['children']) { ?>
                 
                    <?php for ($i = 0; $i < count($category['children']);) { ?>
                   
                      <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                      <?php for (; $i < $j; $i++) { ?>
                      <?php if (isset($category['children'][$i])) { ?>
                      <option value="<?php echo $category['children'][$i]['href']; ?>" <?php if($title==$category['children'][$i]['name']){echo 'selected="selected"';}?>>&nbsp;- <?php echo $category['children'][$i]['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                   
                    <?php } ?>
                  
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
            <?php } ?> 
            <div class="clear"></div> 
         </div>
        <div class="clear"></div>
    </div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li <?php if($title==$category["name"]){echo 'class="active"';}?>><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
  <div class="clear"></div>
</div>
<?php } ?>
<div id="notification"></div>