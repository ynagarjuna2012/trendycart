<div class="box bestsellers">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-product">
      <?php $i=0; foreach ($products as $product) { $i++; ?>
      <li>
      	<div class="name">
        	<span <?php  if(($i==1) || ($i==2) || ($i==3)){ echo 'class="best"'; } ?>><?php echo $i; ?></span>
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
        </div>
        <div class="bestContent">
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
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          	<?php echo $product['price']; ?>
          <?php } else { ?>
          	<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        </div>
      </li>
      <?php } ?>
    </ul>
  </div>
</div>
