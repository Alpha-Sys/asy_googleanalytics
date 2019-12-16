[{$smarty.block.parent}]

[{if $oViewConf->getGaTrackingId()}]
    [{assign var="order" value=$oView->getOrder()}]

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
[{/if}]

[{if $oViewConf->getModuleConfig('sGaConversionId')}]
    [{if $oViewConf->getActiveClassName() == 'thankyou'}]
        [{assign var="oOrder" value=$oView->getOrder()}]
        [{assign var="dOrderSum" value=$oOrder->getTotalOrderSum()}]

        <!-- Google Code for Conversion Page -->
        <script type="text/javascript">
        /* <![CDATA[ */
        var google_conversion_id = [{$oViewConf->getModuleConfig('sGaConversionId')}];
        var google_conversion_language = "de";
        var google_conversion_format = "3";
        var google_conversion_color = "ffffff";
        var google_conversion_label = "[{$oViewConf->getModuleConfig('sGaConversionLabel')}]";
        var google_conversion_value = [{$dOrderSum}];
        var google_conversion_currency = "[{$order->oxorder__oxcurrency->value}]";
        var google_remarketing_only = false;
        /* ]]> */
        </script>
        <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
        </script>
        <noscript>
        <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/[{$oViewConf->getModuleConfig('sGaConversionId')}]/?value=[{$dOrderSum}]&amp;currency_code=[{$order->oxorder__oxcurrency->value}]v&amp;label=[{$oViewConf->getModuleConfig('sGaConversionLabel')}]&amp;guid=ON&amp;script=0"/>
        </div>
        </noscript>
    [{/if}]
[{/if}]