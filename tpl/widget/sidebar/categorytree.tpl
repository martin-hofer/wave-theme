[{block name="dd_widget_sidebar_categorytree"}]
    [{if $oxcmp_categories}]
        [{assign var="categories" value=$oxcmp_categories->getClickRoot()}]
        [{assign var="oxcmp_categories" value=$oxcmp_categories}]
        [{assign var="act" value=$oxcmp_categories->getClickCat()}]
        [{assign var="deepLevel" value=$oView->getDeepLevel()}]
        <div class="categoryBox hidden-xs hidden-sm">
            [{block name="dd_widget_sidebar_categorytree_inner"}]
                <ul class="list-group">

                    [{foreach from=$oxcmp_categories item="ocat" key="catkey" name="root"}]
                        [{if $ocat->getIsVisible()}]
                            [{foreach from=$ocat->getContentCats() item="oTopCont" name="MoreTopCms"}]
                                <li class="list-group-item">
                                    <a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                                </li>
                            [{/foreach}]

                            [{if $categories && $ocat->getId() == $categories[0]->getId()}]

                                [{block name="dd_widget_sidebar_categorytree_list"}]
                                    [{defun name="tree" categories=$categories}]
                                        [{assign var="deepLevel" value=$deepLevel+1}]
                                        [{assign var="oContentCat" value=$oView->getContentCategory()}]
                                        [{foreach from=$categories item="_cat"}]
                                            [{if $_cat->getIsVisible()}]
                                                [{* CMS category *}]
                                                [{if $_cat->getContentCats() && $deepLevel > 1}]
                                                    [{foreach from=$_cat->getContentCats() item="_oCont"}]
                                                        <li class="list-group-item[{if $oContentCat && $oContentCat->getId()==$_oCont->getId()}] active [{else}] end [{/if}]" >
                                                            <a href="[{$_oCont->getLink()}]" class="list-group-link" title="[{$_oCont->oxcontents__oxtitle->value}]"><i></i>[{$_oCont->oxcontents__oxtitle->value}]</a>
                                                        </li>
                                                    [{/foreach}]
                                                [{/if}]

                                                [{* subcategories *}]
                                                [{assign var="oSubCats" value=$_cat->getSubCats()}]
                                                <li class="list-group-item[{if !$oContentCat && $act && $act->getId()==$_cat->getId()}] active[{elseif $_cat->expanded}] exp[{/if}][{if !$_cat->hasVisibleSubCats}] end[{/if}]">
                                                    <a href="[{$_cat->getLink()}]" class="list-group-link" title="[{$_cat->oxcategories__oxtitle->value}]">
                                                        [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($_cat->getNrOfArticles() > 0)}] ([{$_cat->getNrOfArticles()}])[{/if}]
                                                    </a>
                                                    [{if $oSubCats && $_cat->expanded}]
                                                        <ul class="nav nav-pills nav-stacked">[{fun name="tree" categories=$oSubCats}]</ul>
                                                    [{/if}]
                                                </li>
                                            [{/if}]
                                        [{/foreach}]
                                    [{/defun}]
                                [{/block}]

                            [{elseif $oViewConf->getViewThemeParam('sNavigationType') == 'vertical'}]

                                <li class="list-group-item[{if $homeSelected == 'false' && $ocat->expanded}] active[{/if}]">
                                    <a href="[{$ocat->getLink()}]" class="list-group-link">
                                        [{$ocat->oxcategories__oxtitle->value}]
                                    </a>
                                </li>

                            [{/if}]

                        [{/if}]
                    [{/foreach}]

                </ul>
            [{/block}]
        </div>
    [{/if}]
[{/block}]
