<div class="flexslider">
 	<ul id="slideshow<?php echo $module; ?>" class="slides">
    <?php foreach ($banners as $banner) { ?>
		<?php if ($banner['link']) { ?>
        	<li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a></li>
        <?php } else { ?>
    		<li><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></li>
    <?php } ?>
    <?php } ?>
  </ul> 
  <ul class="controls slideTabs">
	<?php $i=0; foreach ($banners as $banner) : $i++; ?>
    	<li><a class="bannerId"><?php echo $i; ?></a><a href="javscript:void(0);" class="bannerTitle"><?php echo $banner['title']; ?></a></li>
    <?php endforeach; ?>
  </ul>  
</div>
  

<script type="text/javascript">
	 $(window).load(function() {
			$('.flexslider').flexslider({
			  animation: slideAnim,
			  slideshow: true,
			  slideshowSpeed: slideSpeed,
			  manualControls: '.controls li',
			  controlsContainer: '.flexslider'
			});
	});
</script>
<div class="clear"></div>
<div class="clear"></div>