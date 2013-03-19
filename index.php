<?php

require_once 'init.php';

$API->TPL->assign('doodstrap',"<h1><a href=\"{$API->SEO->make_link('index')}\">{$API->LANG->_('test')}</a></h1>");
$API->TPL->display('index.tpl');
?>