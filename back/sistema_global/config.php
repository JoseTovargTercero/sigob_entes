<?php



if ($_SERVER['SERVER_NAME'] == 'localhost') {
    define('URL', 'http://localhost/sigob_entes/');
    define('PASSWORD', "");
    define('USER', 'root');
} elseif ($_SERVER['SERVER_NAME'] == 'gitcom-ve.com') {
    define('URL', 'https://sigob.net/');
    define('PASSWORD', "]n^VmqjqCD1k");
    define('USER', 'sigobnet_userroot');
} else {
    $url = 'http://' . $_SERVER['SERVER_NAME'] . '/sigob/';
    define('URL', $url);
    define('PASSWORD', "");
    define('USER', 'root');
}






define('HOST', 'localhost');
define('DB', 'sigobnet_sigob_entes');
define('CHARSET', 'utf8mb4');
