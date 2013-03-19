{include file='header.tpl'}
<body class="software geo-us lang-en-us no-action">

    {include file='navigation.tpl'}


       <div id="main">
        <div id="desktopContentBlockId" class="platform-content-block display-block">

            <div id="content">

                <div class="padder">

                    <div id="title" class="intro has-gcbadge">
                        <div class="left">
                            <h1>{$API->LANG->_('New &amp; Noteworthy')}</h1>
                            <h5>    {$API->LANG->_('Platform')}: 
                            {if !$compatibility}[{$API->LANG->_('All')}] [<a href="{$API->SEO->make_link('index','compatibility',1,'price',$price)}">iOS</a>] [<a href="{$API->SEO->make_link('index','compatibility',2,'price',$price)}">iPhone</a>] [<a href="{$API->SEO->make_link('index','compatibility',3,'price',$price)}">iPad</a>] [<a href="{$API->SEO->make_link('index','compatibility',4,'price',$price)}">Mac</a>]
                            {elseif $compatibility==1}[<a href="{$API->SEO->make_link('index','compatibility',0,'price',$price)}">{$API->LANG->_('All')}</a>] [iOS] [<a href="{$API->SEO->make_link('index','compatibility',2,'price',$price)}">iPhone</a>] [<a href="{$API->SEO->make_link('index','compatibility',3,'price',$price)}">iPad</a>] [<a href="{$API->SEO->make_link('index','compatibility',4,'price',$price)}">Mac</a>]
                            {elseif $compatibility==2}[<a href="{$API->SEO->make_link('index','compatibility',0,'price',$price)}">{$API->LANG->_('All')}</a>] [<a href="{$API->SEO->make_link('index','compatibility',1,'price',$price)}">iOS</a>] [iPhone] [<a href="{$API->SEO->make_link('index','compatibility',3,'price',$price)}">iPad</a>] [<a href="{$API->SEO->make_link('index','compatibility',4,'price',$price)}">Mac</a>]
                            {elseif $compatibility==3}[<a href="{$API->SEO->make_link('index','compatibility',0,'price',$price)}">{$API->LANG->_('All')}</a>] [<a href="{$API->SEO->make_link('index','compatibility',1,'price',$price)}">iOS</a>] [<a href="{$API->SEO->make_link('index','compatibility',2,'price',$price)}">iPhone</a>] [iPad] [<a href="{$API->SEO->make_link('index','compatibility',4,'price',$price)}">Mac</a>]
                            {elseif $compatibility==4}[<a href="{$API->SEO->make_link('index','compatibility',0,'price',$price)}">{$API->LANG->_('All')}</a>] [<a href="{$API->SEO->make_link('index','compatibility',1,'price',$price)}">iOS</a>] [<a href="{$API->SEO->make_link('index','compatibility',2,'price',$price)}">iPhone</a>] [<a href="{$API->SEO->make_link('index','compatibility',3,'price',$price)}">iPad</a>] [Mac]
                            {/if}
                        
                        </h5>
                            <h5>
                                {$API->LANG->_('Apps')}: 
                                {if !$price}[{$API->LANG->_('All')}] [<a href="{$API->SEO->make_link('index','compatibility',$compatibility,'price','1')}">{$API->LANG->_('Paid')}</a>] [<a href="{$API->SEO->make_link('index','compatibility',$compatibility,'price','2')}">{$API->LANG->_('Free')}</a>]
                                {elseif $price==1}[<a href="{$API->SEO->make_link('index','compatibility',$compatibility,'price','0')}">{$API->LANG->_('All')}</a>] [{$API->LANG->_('Paid')}] [<a href="{$API->SEO->make_link('index','compatibility',$compatibility,'price','2')}">{$API->LANG->_('Free')}</a>]
                                {elseif $price==2}[<a href="{$API->SEO->make_link('index','compatibility',$compatibility,'price','0')}">{$API->LANG->_('All')}</a>] [<a href="{$API->SEO->make_link('index','compatibility',$compatibility,'price','1')}">{$API->LANG->_('Paid')}</a>] [{$API->LANG->_('Free')}]
                                {/if}
                            </h5>
                        </div>
                        <div class="right">
                            {$pagercode}
                        </div>
                    </div>
{if !$apps}
<div style="text-align:center; font-size:40px; padding-bottom: 40px;">{$API->LANG->_('No apps yet')}!</div>
{else}
                    <div>
						<div class="aplication-container">
                                                    {foreach from=$apps item=a}
							<div class="application-box">
								<a href="{$API->SEO->make_link('view','trackid',$a.trackid)}">
									<img src="{$a.image}" alt="{$a.name}" />
								</a>
                                                                <p title="{$a.name}" class="aa-tipsy"><b><a href="{$API->SEO->make_link('view','trackid',$a.trackid)}">{$a.name|truncate:15}</a></b></p>
								<p><a href="{$API->SEO->make_link('search','genre',$a.genre_id,'compatibility',$compatibility)}">{$API->LANG->_($a.gname)}{if $a.is_mas} (Mac){/if}</a></p>
                                                                </div>
                                                        {/foreach}
							

						</div>
                    </div>
{/if}

                </div>


            </div>
        </div>


    </div>


{include file="footer.tpl"}