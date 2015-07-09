<?php

#echo  print_r(get_defined_vars());
echo "";
echo "";
echo "";
echo "";
echo "";
echo "<br>###########################################################<br>";

echo "SERVER NAME ---->  " . $_SERVER["SERVER_NAME"] ;
echo "<br>REMOTE ADDR ---->  " . $_SERVER["REMOTE_ADDR"] ;
echo "<br>SERVER ADDR ---->  " . $_SERVER["SERVER_ADDR"] ;
echo "<br>HTTP_X_FORWARD ---> " . $_SERVER["HTTP_X_FORWARDED_FOR"];
echo "<br>HTTP_CONNECTION ---> " . $_SERVER["HTTP_CONNECTION"];
echo "<br>PORT      ---> " . $_SERVER["SERVER_PORT"];
echo "<br>SSL Version ---> " . $_SERVER["SSL_VERSION_LIBRARY"];
echo "<br>SSL_SERVER_I_DN_CN ---> " . $_SERVER["SSL_SERVER_I_DN_CN"];
echo "<br>SSL_SERVER_S_DN_CN ---> " . $_SERVER["SSL_SERVER_S_DN_CN"];
echo "<br>###########################################################<br>";
echo "<br>###########################################################<br>";
echo "<br>###########################################################<br>";
?>
echo "<pre>";
var_dump($_SERVER);
echo "</pre>";



