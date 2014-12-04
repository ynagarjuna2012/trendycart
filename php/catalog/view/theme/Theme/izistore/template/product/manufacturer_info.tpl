<?php echo $header; ?>
<ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    	<li><?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
</ul>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display">
        <ul>
        	<li class="list"><a href="javascript:void(0);" title="<?php echo $text_list; ?>"><?php echo $text_list; ?></a></li> 
        	<li class="grid"><a class="active" href="javascript:void(0);" title="<?php echo $text_grid; ?>"><?php echo $text_grid; ?></a></li>
    	</ul>
    </div>
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
      <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
      <div class="clear"></div>
  </div>
  <div id="cat-products" class="prod-grid product-list">
  <ul class="box-product">
    <?php $i=0; $pCount = count($products); foreach ($products as $product) { $i++; ?>
        <li <?php if($i%3==0){ echo 'class="last"'; }?>>
            <?php if ($product['thumb']) { ?>
                <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
               <?php $styles =  $this->config->get('izioptions');//Izistore Module Options  ?>
		<?php if(!$styles || $styles['promo'] == 'Show') : ?>
			<?php if ($product['price'] && $product['special']): ?>
                    <div class="off">
                        <?php 
                              //Get Currency Symbol				  
                              $symLeft = $this->currency->getSymbolLeft();
                              $symRight = $this->currency->getSymbolRight();
                              
                              if($symLeft != NULL){
                                $currCode = $this->currency->getSymbolLeft();
                              }else{
                                $currCode = $this->currency->getSymbolRight();
                              }
                        
                              //Get the percentage discount
                              $normal =  strip_tags(str_replace($currCode,'', $product['price']));
                                $normalP = strip_tags(str_replace(',','', $normal));
                              $special = strip_tags(str_replace($currCode,'', $product['special']));
                                $specialP = strip_tags(str_replace(',','', $special));
                              $percent = ($normalP-$specialP)/$normalP*100;
                              echo "<span>" . round($percent) . '<em>%</em>' . "</span>";		 
                              echo "<span class=\"text_off\">" . $this->language->get('text_off') . "</span>";
                        ?>            
                    </div>
                 <?php endif; ?>       
              <?php endif; ?>  
                
                </div>
            <?php } ?>
            <div class="prodDesc">
                <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                <div class="description"><?php echo $product['description']; ?></div>
                <?php if ($product['rating']) { ?>
                    <div class="rating"><img src="catalog/view/theme/izistore/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                    <div class="price">
                <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                <?php } else { ?>
                    <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                    &nbsp; <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
                    </div>
                <?php } ?>
                <div class="addTo">
                    <div class="cart">
                        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
                    </div>
                	<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
                	<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div> 
                    <div class="clear"></div>
            	</div>
            </div>
            <div class="clear"></div>
            </li>
            <?php 
				if($i%3==0 && $pCount>3 && $pCount>$i){
					echo '</ul><ul class="box-product">';
				}
	  		?>
    <?php } ?>    
  </ul>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  
  </div>
<?php echo $footer; ?>