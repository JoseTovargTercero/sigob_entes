<?php



if ($_SERVER['SERVER_NAME'] == 'localhost') {
    define('HOST', 'localhost');
define('DB', 'sigobnet_sigob_entes');
define('CHARSET', 'utf8mb4');
    define('URL', 'http://localhost/sigob_entes/');
    define('PASSWORD', "");
    define('USER', 'root');
} elseif ($_SERVER['SERVER_NAME'] == 'sigob.net') {
    define('HOST', 'sigob.net');
    define('DB', 'sigobnet_sigob_entes');
    define('CHARSET', 'utf8mb4');
    define('URL', 'https://sigob.net/sigob_net/');
    define('PASSWORD', "]n^VmqjqCD1k");
    define('USER', 'sigobnet_userroot');
} else {
    $url = 'http://' . $_SERVER['SERVER_NAME'] . '/sigob_entes/';
    define('HOST', 'sigob.net');
    define('DB', 'sigobnet_sigob_entes');
    define('CHARSET', 'utf8mb4');
    define('URL', $url);
    define('PASSWORD', "]n^VmqjqCD1k");
    define('USER', 'sigobnet_userroot');
}


