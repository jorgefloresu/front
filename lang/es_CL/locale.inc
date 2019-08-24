<?php
/**********************************************************************
    Copyright (C) FrontAccounting, LLC.
	Released under the terms of the GNU General Public License, GPL, 
	as published by the Free Software Foundation, either version 3 
	of the License, or (at your option) any later version.
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
    See the License here <http://www.gnu.org/licenses/gpl-3.0.html>.
***********************************************************************/
/*
	This file contains templates for all country specific functions.
	If your locale needs special functionality provided by hook functions
	copy this file to respective lang/xx_XX directory and edit templates below.
	You can safely remove not used function templates.
	
	Name it after language code e.g. hooks_en_US
*/
class hooks_es_CL extends hooks {

	//
	// Price in words. $doc_type is set to document type and can be used to suppress 
	// price in words printing for selected document types.
	// Used instead of built in simple english price_in_words() function.
	//
	//	Returns: amount in words as string.
	// function price_in_words($amount, $doc_type)
	function price_in_words($num, $doc_type, $currency, $fem = false, $dec = true)
	{
           $matuni[2]  = "dos"; 
           $matuni[3]  = "tres"; 
           $matuni[4]  = "cuatro"; 
           $matuni[5]  = "cinco"; 
           $matuni[6]  = "seis"; 
           $matuni[7]  = "siete"; 
           $matuni[8]  = "ocho"; 
           $matuni[9]  = "nueve"; 
           $matuni[10] = "diez"; 
           $matuni[11] = "once"; 
           $matuni[12] = "doce"; 
           $matuni[13] = "trece"; 
           $matuni[14] = "catorce"; 
           $matuni[15] = "quince"; 
           $matuni[16] = "dieciseis"; 
           $matuni[17] = "diecisiete"; 
           $matuni[18] = "dieciocho"; 
           $matuni[19] = "diecinueve"; 
           $matuni[20] = "veinte"; 
           $matunisub[2] = "dos"; 
           $matunisub[3] = "tres"; 
           $matunisub[4] = "cuatro"; 
           $matunisub[5] = "quin"; 
           $matunisub[6] = "seis"; 
           $matunisub[7] = "sete"; 
           $matunisub[8] = "ocho"; 
           $matunisub[9] = "nove"; 

           $matdec[2] = "veint"; 
           $matdec[3] = "treinta"; 
           $matdec[4] = "cuarenta"; 
           $matdec[5] = "cincuenta"; 
           $matdec[6] = "sesenta"; 
           $matdec[7] = "setenta"; 
           $matdec[8] = "ochenta"; 
           $matdec[9] = "noventa"; 
           $matsub[3]  = 'mill'; 
           $matsub[5]  = 'bill'; 
           $matsub[7]  = 'mill'; 
           $matsub[9]  = 'trill'; 
           $matsub[11] = 'mill'; 
           $matsub[13] = 'bill'; 
           $matsub[15] = 'mill'; 
           $matmil[4]  = 'millones'; 
           $matmil[6]  = 'billones'; 
           $matmil[7]  = 'de billones'; 
           $matmil[8]  = 'millones de billones'; 
           $matmil[10] = 'trillones'; 
           $matmil[11] = 'de trillones'; 
           $matmil[12] = 'millones de trillones'; 
           $matmil[13] = 'de trillones'; 
           $matmil[14] = 'billones de trillones'; 
           $matmil[15] = 'de billones de trillones'; 
           $matmil[16] = 'millones de billones de trillones'; 

           //Zi hack
           $float=explode('.',$num);
           $new_num = round($num, 2);
           $num=$float[0];

           $num = trim((string)@$num); 
           if ($num[0] == '-') { 
              $neg = 'menos '; 
              $num = substr($num, 1); 
           }else 
              $neg = ''; 
           while ($num[0] == '0') $num = substr($num, 1); 
           if ($num[0] < '1' or $num[0] > 9) $num = '0' . $num; 
           $zeros = true; 
           $punt = false; 
           $ent = ''; 
           $fra = ''; 
           for ($c = 0; $c < strlen($num); $c++) { 
              $n = $num[$c]; 
              if (! (strpos(".,'''", $n) === false)) { 
                 if ($punt) break; 
                 else{ 
                    $punt = true; 
                    continue; 
                 } 

              }elseif (! (strpos('0123456789', $n) === false)) { 
                 if ($punt) { 
                    if ($n != '0') $zeros = false; 
                    $fra .= $n; 
                 }else 

                    $ent .= $n; 
              }else 

                 break; 

           } 
           $ent = '     ' . $ent; 
           if ($dec and $fra and ! $zeros) { 
              $fin = ' coma'; 
              for ($n = 0; $n < strlen($fra); $n++) { 
                 if (($s = $fra[$n]) == '0') 
                    $fin .= ' cero'; 
                 elseif ($s == '1') 
                    $fin .= $fem ? ' una' : ' un'; 
                 else 
                    $fin .= ' ' . $matuni[$s]; 
              } 
           }else 
              $fin = ''; 
           if ((int)$ent === 0) return 'Cero ' . $fin; 
           $tex = ''; 
           $sub = 0; 
           $mils = 0; 
           $neutro = false; 
           while ( ($num = substr($ent, -3)) != '   ') { 
              $ent = substr($ent, 0, -3); 
              if (++$sub < 3 and $fem) { 
                 $matuni[1] = 'una'; 
                 $subcent = 'as'; 
              }else{ 
                 $matuni[1] = $neutro ? 'un' : 'uno'; 
                 $subcent = 'os'; 
              } 
              $t = ''; 
              $n2 = substr($num, 1); 
              if ($n2 == '00') { 
              }elseif ($n2 < 21) 
                 $t = ' ' . $matuni[(int)$n2]; 
              elseif ($n2 < 30) { 
                 $n3 = $num[2]; 
                 if ($n3 != 0) $t = 'i' . $matuni[$n3]; 
                 $n2 = $num[1]; 
                 $t = ' ' . $matdec[$n2] . $t; 
              }else{ 
                 $n3 = $num[2]; 
                 if ($n3 != 0) $t = ' y ' . $matuni[$n3]; 
                 $n2 = $num[1]; 
                 $t = ' ' . $matdec[$n2] . $t; 
              } 
              $n = $num[0]; 
              if ($n == 1) { 
                 $t = ' ciento' . $t; 
              }elseif ($n == 5){ 
                 $t = ' ' . $matunisub[$n] . 'ient' . $subcent . $t; 
              }elseif ($n != 0){ 
                 $t = ' ' . $matunisub[$n] . 'cient' . $subcent . $t; 
              } 
              if ($sub == 1) { 
              }elseif (! isset($matsub[$sub])) { 
                 if ($num == 1) { 
                    $t = ' mil'; 
                 }elseif ($num > 1){ 
                    $t .= ' mil'; 
                 } 
              }elseif ($num == 1) { 
                 $t .= ' ' . $matsub[$sub] . utf8_decode('ón'); 
              }elseif ($num > 1){ 
                 $t .= ' ' . $matsub[$sub] . 'ones'; 
              }   
              if ($num == '000') $mils ++; 
              elseif ($mils != 0) { 
                 if (isset($matmil[$sub])) $t .= ' ' . $matmil[$sub]; 
                 $mils = 0; 
              } 
              $neutro = true; 
              $tex = $t . $tex; 
           } 
           $tex = $neg . substr($tex, 1) . $fin; 
           //Zi hack --> return ucfirst($tex);
           if ($float[1] == 0) $decim = '00';
           else {
              $whole = explode('.', $new_num);
              $decim = $whole[1];
           }
           $end_num=ucfirst($tex);
           if ($doc_type != ST_PURCHORDER) {
           //    $end_num .= ' pesos m/cte';
           } else
               $end_num .=  utf8_decode(' dólares') . ' '. $decim . '/100' ;
           //if ($currency == 'COP')
           //    $end_num .= ' pesos m/cte';
           //else
           //    $end_num .= utf8_decode(' dólares');
           return $end_num; 

	}

/*
	//
	// Exchange rate currency $curr as on date $date.
	// Keep in mind FA has internally implemented 3 exrate providers
	// If any of them supports your currency, you can simply use function below
	// with apprioprate provider set, otherwise implement your own.
	// Returns: $curr value in home currency units as a real number.
	
	function retrieve_ex_rate($curr, $date)
	{
	 	$provider = 'ECB'; // 'ECB', 'YAHOO' or 'GOOGLE'
		return get_extern_rate($curr, $provider, $date);
	}
*/
/*
	// Generic function called at the end of Tax Report (report 709)
	// Can be used e.g. for special database updates on every report printing
	// or to print special tax report footer 
	//
	// Returns: nothing
	function tax_report_done()
	{
	}
*/
}
?>