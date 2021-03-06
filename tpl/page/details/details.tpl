[{if !$blWorkaroundInclude}]
    [{capture append="oxidBlock_content"}]
        [{if $oxcmp_user}]
            [{assign var="force_sid" value=$oView->getSidForWidget()}]
        [{/if}]
        [{oxid_include_widget cl="oxwArticleDetails" _parent=$oView->getClassName() nocookie=1 force_sid=$force_sid _navurlparams=$oViewConf->getNavUrlParams() _object=$oView->getProduct() anid=$oViewConf->getActArticleId() iPriceAlarmStatus=$oView->getPriceAlarmStatus() sorting=$oView->getSortingParameters() skipESIforUser=1}]
    [{/capture}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{assign var="oDetailsProduct" value=$oView->getProduct()}]
    [{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{assign var="sPageHeadTitle" value=$oDetailsProduct->oxarticles__oxtitle->value|cat:' '|cat:$oDetailsProduct->oxarticles__oxvarselect->value}]

    [{if $oView->getPriceAlarmStatus() == 1}]
        [{assign var="_statusMessage1" value="PAGE_DETAILS_THANKYOUMESSAGE1"|oxmultilangassign|cat:" "|cat:$oxcmp_shop->oxshops__oxname->value}]
        [{assign var="_statusMessage2" value="PAGE_DETAILS_THANKYOUMESSAGE2"|oxmultilangassign|cat:" "}]
        [{assign var="_statusMessage3" value="PAGE_DETAILS_THANKYOUMESSAGE3"|oxmultilangassign|cat:" "|cat:$oView->getBidPrice()|cat:" "|cat:$currency->sign|cat:" "}]
        [{assign var="_statusMessage4" value="PAGE_DETAILS_THANKYOUMESSAGE4"|oxmultilangassign}]
        [{include file="message/success.tpl" statusMessage=`$_statusMessage1``$_statusMessage2``$_statusMessage3``$_statusMessage4`}]
    [{elseif $oView->getPriceAlarmStatus() == 2}]
        [{assign var="_statusMessage" value="MESSAGE_WRONG_VERIFICATION_CODE"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{elseif $oView->getPriceAlarmStatus() === 0}]
        [{assign var="_statusMessage1" value="MESSAGE_NOT_ABLE_TO_SEND_EMAIL"|oxmultilangassign|cat:"<br> "}]
        [{assign var="_statusMessage2" value="MESSAGE_VERIFY_YOUR_EMAIL"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=`$_statusMessage1``$_statusMessage2`}]
    [{/if}]

    <div id="details_container" class="details">
        [{if $oView->getSearchTitle()}]
            [{assign var="detailsLocation" value=$oView->getSearchTitle()}]
        [{else}]
            [{foreach from=$oView->getCatTreePath() item=oCatPath name="detailslocation"}]
                [{if $smarty.foreach.detailslocation.last}]
                    [{assign var="detailsLocation" value=$oCatPath->oxcategories__oxtitle->value}]
                [{/if}]
            [{/foreach}]
        [{/if}]

        [{* details locator *}]
        [{assign var="actCategory" value=$oView->getActiveCategory()}]
        <div class="row details-pager" id="detailsItemsPager">
            <div class="col-3 details-pager-overview">
                <a href="[{$actCategory->toListLink}]" class="details-pager-link">
                    <i class="fa fa-bars"></i> [{oxmultilang ident="BACK_TO_OVERVIEW"}]
                </a>
            </div>
            <div class="col-3  details-pager-prev">
                [{if $actCategory->prevProductLink}]
                <a id="linkPrevArticle" class="details-pager-link" href="[{$actCategory->prevProductLink}]">
                    <i class="fa fa-angle-left"></i>
                    [{oxmultilang ident="PREVIOUS_PRODUCT"}]
                </a>
                [{/if}]
            </div>
            <div class="col-3 text-center details-pager-current-page">
                [{if $actCategory->iProductPos}]
                    [{oxmultilang ident="PRODUCT"}] [{$actCategory->iProductPos}] [{oxmultilang ident="OF"}] [{$actCategory->iCntOfProd}]
                [{/if}]
            </div>
            <div class="col-3 text-right  details-pager-next">
                [{if $actCategory->nextProductLink}]
                    <a id="linkNextArticle" class="details-pager-link" href="[{$actCategory->nextProductLink}]">
                        [{oxmultilang ident="NEXT_PRODUCT"}] <i class="fa fa-angle-right"></i>
                    </a>
                [{/if}]
            </div>
        </div>

        [{* RDFa offering*}]
        <div class="details-product-info" id="productinfo">
            [{include file="page/details/inc/fullproductinfo.tpl"}]
        </div>
    </div>
[{/if}]
