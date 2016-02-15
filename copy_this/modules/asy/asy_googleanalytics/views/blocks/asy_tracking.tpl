[{$smarty.block.parent}]

[{* Google Analytics integration *}]
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', '[{$oViewConf->getGaTrackingId()}]', 'auto');
    ga('send', 'pageview');
    ga('set', 'anonymizeIp', true);

    [{if $oViewConf->isGaEcommerceTrackingActive() && $oViewConf->getActiveClassName() == 'thankyou'}]
        [{assign var="order" value=$oView->getOrder()}]
        [{assign var="dTotalOrdersum" value=$order->oxorder__oxtotalbrutsum->value}]
        [{assign var="dTotalOrdersumNetto" value=$order->oxorder__oxtotalnetsum->value}]
        [{assign var="dOrderTax" value=$dTotalOrdersum-$dTotalOrdersumNetto}]

        [{* Google Analytics ecommerce tracking *}]
        ga('require', 'ecommerce');

        [{* transaction *}]
        ga('ecommerce:addTransaction', {
          'id': '[{$order->oxorder__oxordernr->value}]',                              // Transaction ID. Required.
          'affiliation': '[{$oxcmp_shop->oxshops__oxname->value|escape:"quotes"}]',   // Affiliation or store name.
          'revenue': '[{$dTotalOrdersum}]',                                           // Grand Total.
          'shipping': '[{$order->oxorder__oxdelcost->value}]',                        // Shipping.
          'tax': '[{$dOrderTax}]'                                                     // Tax.
        });

        [{* items *}]
        [{foreach from=$order->getOrderArticles() item=oOrderArticle}]
            ga('ecommerce:addItem', {
                'id': '[{$order->oxorder__oxordernr->value}]',                                    // Transaction ID. Required.
                'name': '[{$oOrderArticle->oxorderarticles__oxtitle->value|escape:"quotes"}]',    // Product name. Required.
                'sku': '[{$oOrderArticle->oxorderarticles__oxartnum->value|escape:"quotes"}]',    // SKU/code.
                'price': '[{$oOrderArticle->oxorderarticles__oxprice->value}]',                   // Unit price.
                'quantity': '[{$oOrderArticle->oxorderarticles__oxamount->value}]'                // Quantity.
            });
        [{/foreach}]

        ga('ecommerce:send');
    [{/if}]
</script>