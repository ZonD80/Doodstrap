<?php

/**
 * Script that initializes all stuff
 *
 */
define('INIT', true);
define('DS', DIRECTORY_SEPARATOR);
define('TIME', time());


require_once 'classes' . DS . 'api.class.php';

$db = array(
    'host' => 'localhost',
    'user' => 'DB_USER',
    'pass' => 'DB_PASS',
    'db' => 'DB_DB',
    'charset' => 'utf8'
);

$CONFIG = array(
    'debug_language' => 1,
    'static_language' => 0,
    'languages'=>'en',
    'defaultbaseurl' => 'http://YOUR_SITE/',
    'sitename' => 'SITE_NAME',
    'siteemail' => 'noreply@YOUR_SITE',
    'adminemail' => 'admin@YOUR_SITE',
    'ROOT_PATH' => dirname(__FILE__) . DS,
    'TIME' => time(),
    'START' => microtime(true),
    'CACHEDRIVER' => 'native',
    'cache_dir' => dirname(__FILE__) . DS . 'cache',
    'TEMPLATE_PATH' => dirname(__FILE__) . DS . 'tpl',
);
$API = new API($CONFIG, $db);

$API->TPL->template_dir = $CONFIG['TEMPLATE_PATH'];

if ($_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest')
    define("AJAX", true);
else
    define("AJAX", false);

$API->session();

$API->LANG = new LANG($API);

?>