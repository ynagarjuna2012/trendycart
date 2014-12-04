<div class="box latest">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content box-latest">
    <ul class="box-product">
      <?php $i=0; $pCount = count($products); foreach ($products as $product) { $i++; ?>
      <li <?php if($i%3==0){ echo 'class="last"'; }?>>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
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
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
        </div>
        <?php } ?>
       <?php /*?> 
        <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div><?php */?>
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
</div>
