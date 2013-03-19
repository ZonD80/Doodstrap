<?php

header('Content-Type: application/xml');
require_once 'init.php';


        $to_rss[] = array('title' => 'test',
            'pubDate' => $API->CONFIG['TIME'],
            'link' => $API->SEO->make_link('index'),
            'description' => $API->CONFIG['sitename']);
    require_once 'classes' . DS . 'rss.class.php';

    $rss = new rss_generator(API->LANG->_('RSS feed'));

    $rss->link = $CONFIG['defaultbaseurl'];
    $rss->description = $API->LANG->_('RSS Feed');
    $output = $rss->get($to_rss);

print $output;
?>