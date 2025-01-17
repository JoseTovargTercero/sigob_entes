<?php



if ($_SERVER['SERVER_NAME'] == 'localhost') {
    define('URL', 'http://localhost/sigob_entes/');
    define('PASSWORD', "");
    define('USER', 'root');
} elseif ($_SERVER['SERVER_NAME'] == 'sigobs.net') {
    define('URL', 'http://sigobs.net/');
    define('PASSWORD', "");
    define('USER', 'root');
} else {
    $url = 'http://' . $_SERVER['SERVER_NAME'] . '/sigob/';
    define('URL', $url);
    define('PASSWORD', "");
    define('USER', 'root');
}






define('HOST', 'localhost');
define('DB', 'sigobnet_sigob_entes');
define('CHARSET', 'utf8mb4');
