<div id="currency">
	<?php if (count($currencies) > 1) { ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
      <div class="currency"><p><?php echo $text_currency; ?></p>
        <?php foreach ($currencies as $currency) { ?>
        <?php if ($currency['code'] == $currency_code) { ?>
        <?php if ($currency['symbol_left']) { ?>
        <a title="<?php echo $currency['title']; ?>"><strong><?php echo $currency['symbol_left']; ?></strong></a>
        <?php } else { ?>
        <a title="<?php echo $currency['title']; ?>"><strong><?php echo $currency['symbol_right']; ?></strong></a>
        <?php } ?>
        <?php } else { ?>
        <?php if ($currency['symbol_left']) { ?>
        <a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><?php echo $currency['symbol_left']; ?></a>
        <?php } else { ?>
        <a title="<?php echo $currency['title']; ?>" onClick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>').submit(); $(this).parent().parent().submit();"><?php echo $currency['symbol_right']; ?></a>
        <?php } ?>
        <?php } ?>
        <?php } ?>
        <input type="hidden" name="currency_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
      </div>
    </form>
    <?php } ?>
</div>
