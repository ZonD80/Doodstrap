{include file='doctype.tpl'}<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>AppAddict.org - {$API->LANG->_('Login')}</title>
    <style type="text/css">

    body {
        text-align: center;
    }

    img {
        border-width: 0px; /* need this for firefox */
    }

    div.loadingbox {
        border: 3px solid #ccc;
        width: 390px;
        margin: auto;
        margin-top: 50px;
        padding: 0px;
        text-align: left;
    }

    table.info {
        width: 270px;
    }

    div.cover {
        width: 100px;
        text-align: right;
    }

    div.loadingbox div.cover img {
        margin-top: 40px;
    }

    div.loadingbox p {
        color: #999;
        font: 14px 'Lucida Grande', LucidaGrande, Lucida, Helvetica, Arial, sans-serif;
        margin: 0;
        padding: 1px 10px 0px 10px;
    }

    div.loadingbox p.title {
        color: #333;
        font-size: 26px;
        font-weight: bold;
        padding: 0px 20px 3px 20px;

    }

    div.loadingbox p.subtitle {
        color: #666;
        font-size: 15px;
        padding: 0px 20px;
    }

    div.loadingbox p.heading {
        color: #666;
        font-size: 15px;
        padding-top: 15px;
        padding-bottom: 5px;
        font-weight: bold;
    }

    div.loadingbox p.footer {
        color: #666;
        font-size: 12px;
        text-align: center;
        padding: 20px 20px 0px 20px;
    }

    div.roundtop { 
        background: url('/images/htmlcorners/tr.jpg') no-repeat top right;
        position: relative;
        right: -3px;
        top: -3px;
    }

    div.roundbot { 
        background: url('/images/htmlcorners/br.jpg') no-repeat top right;
        position: relative;
        right: -3px;
        bottom: -3px;
    }

    img.corner {
        width: 13px;
        height: 13px;
        border: none;
        display: block !important;
        position: relative;
        left: -6px;
    }

    div.clear {
        clear: both;
    }

    p.dark {
        color: #333;
    }

    a {
        text-decoration: underline;
        border-width: 0px;
    }

    </style>
  </head><style type="text/css"></style>

  <body>
<form acthon="{$API->SEO->make_link('login')}" method="POST">
    <input type="hidden" name="returnto" value="{$returnto}"/>
   <div class="loadingbox">
     <div class="roundtop"><img width="13" height="13" alt="" class="corner" style="display: none" src="./message_files/tl.jpg"></div>
      <p class="title">{$API->LANG->_('Login to')} AppAddict</p>
      <p class="subtitle">{$API->LANG->_('Please provide yours email and password')}:</p>

        <center><input type="email" name="email" required="required"/><br/><input type="password" name="password" required="required"/></center><br>

       <div class="clear"></div>

         
         <div id="itunes-client-required" >
          <center>
              {if $error=='invalid'}<p style="color: red;">
            {$API->LANG->_('Email or password is invalid')}.
           </p><br>
           {elseif $error=='auth'}<p style="color: red;">
            {$API->LANG->_('You must be logged in to continue')}.
           </p><br>
           {elseif $error=='access'}<p style="color: red;">
            {$API->LANG->_('You must have required permissions to access this page')}.
           </p><br>{/if}
            <input type="submit" value="{$API->LANG->_('Login')}"/></center>
         </div>


      <p class="footer"><a href="/">{$API->LANG->_('Main page')}</a> | <a href="{$API->SEO->make_link('signup')}">{$API->LANG->_('Sign up here')}</a> | <a href="{$API->SEO->make_link('iforgot')}">{$API->LANG->_('Reset password')}</a></p>
      <div class="roundbot"><img width="13" height="13" alt="" class="corner" style="display: none" src="./message_files/bl.jpg"></div>
   </div>        </form> 
</body></html>