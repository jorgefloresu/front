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
$page_security = 'SA_SALESBULKREP';
// ----------------------------------------------------------------
// $ Revision:	2.0 $
// Creator:	Joe Hunt
// date_:	2005-05-19
// Title:	Order Status List
// ----------------------------------------------------------------
$path_to_root="..";

include_once($path_to_root . "/includes/session.inc");
include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/data_checks.inc");
include_once($path_to_root . "/sales/includes/sales_db.inc");
include_once($path_to_root . "/inventory/includes/db/items_category_db.inc");

//----------------------------------------------------------------------------------------------------

print_order_status_list();

//----------------------------------------------------------------------------------------------------

function GetSalesInvoices($from, $to, $category=0, $location=null, $fromsupp='', $debtor)
{
	$fromdate = date2sql($from);
	$todate = date2sql($to);

        $sql= "SELECT ".TB_PREF."debtor_trans.reference,
                    ".TB_PREF."debtor_trans.debtor_no,
                    ".TB_PREF."debtor_trans.branch_code,
                    ".TB_PREF."debtor_trans.order_,
                    ".TB_PREF."debtor_trans.tran_date,
                    ".TB_PREF."debtor_trans.due_date,
                    ".TB_PREF."debtor_trans.ov_amount,
                    ".TB_PREF."debtor_trans_details.stock_id,
                    ".TB_PREF."suppliers.supp_name,
                    ".TB_PREF."debtor_trans_details.unit_price,
                    ".TB_PREF."purch_data.price,
                    ".TB_PREF."suppliers.supp_account_no as comision,
                    ".TB_PREF."purch_data.price,
                    ".TB_PREF."suppliers.supp_account_no as comision,
                    ROUND(".TB_PREF."purch_data.price * ".TB_PREF."suppliers.supp_account_no,2) as valor_proveedor
		FROM ".TB_PREF."debtor_trans, ".TB_PREF."debtor_trans_details, ".TB_PREF."purch_data, ".TB_PREF."suppliers 
		WHERE ".TB_PREF."debtor_trans.trans_no = ".TB_PREF."debtor_trans_details.debtor_trans_no
                    AND ".TB_PREF."debtor_trans.type = ".TB_PREF."debtor_trans_details.debtor_trans_type
                    AND ".TB_PREF."debtor_trans_details.stock_id = ".TB_PREF."purch_data.stock_id
                    AND ".TB_PREF."purch_data.supplier_id = ".TB_PREF."suppliers.supplier_id
                    AND ".TB_PREF."debtor_trans.tran_date >='$fromdate'
                    AND ".TB_PREF."debtor_trans.tran_date <='$todate'
                    AND ".TB_PREF."debtor_trans.type=".ST_SALESINVOICE."
                    AND ".TB_PREF."debtor_trans.ov_amount>0";
           
	//if ($category > 0)
	//	$sql .= " AND ".TB_PREF."stock_master.category_id=".db_escape($category);
	//if ($location != null)
	//	$sql .= " AND ".TB_PREF."sales_orders.from_stk_loc=".db_escape($location);
    if ($debtor != ALL_TEXT)
		$sql .= " AND ".TB_PREF."debtor_trans.debtor_no=".db_escape($debtor);
	if ($fromsupp != '')
		$sql .= " AND ".TB_PREF."suppliers.supplier_id=".db_escape($fromsupp);
	//if ($backorder)
	//	$sql .= " HAVING facturado = 'SI' AND quantity > 0";
	$sql .= " ORDER BY ".TB_PREF."suppliers.supplier_id,".TB_PREF."debtor_trans.reference";

	return db_query($sql, "Error getting order details");
}

//----------------------------------------------------------------------------------------------------

function print_order_status_list()
{
	global $path_to_root,$pic_height, $pic_width;

	$from = $_POST['PARAM_0'];
	$to = $_POST['PARAM_1'];
	//$category = $_POST['PARAM_2'];
	//$location = $_POST['PARAM_3'];
    $fromcust = $_POST['PARAM_2'];
    $fromsupp = $_POST['PARAM_3'];
	//$backorder = $_POST['PARAM_4'];
	//$comments = $_POST['PARAM_5'];
	$orientation = $_POST['PARAM_4'];
	$destination = $_POST['PARAM_5'];
	if ($destination)
		include_once($path_to_root . "/reporting/includes/excel_report.inc");
	else
		include_once($path_to_root . "/reporting/includes/pdf_report.inc");
	$orientation = ($orientation ? 'L' : 'P');

	//if ($category == ALL_NUMERIC)
	//	$category = 0;
	//if ($location == ALL_TEXT)
	//	$location = null;
	if ($fromcust == ALL_TEXT)
		$cust = _('All');
	else
		$cust = get_customer_name($fromcust);
	if ($fromsupp == '')
		$froms = _('All');
	else
		$froms = get_supplier_name($fromsupp);

//	$cols = array(0, 60, 150, 260, 325,	385, 450);
	$cols = array(0, 45, 125, 250, 325, 390,	450, 525);

	$headers2 = array('', '', '', '', '', '', ('Total Factura'));

	$aligns = array('left',	'left',	'right', 'right', 'right', 'right',	'right');

	$headers = array('', '', _('Customer'), _('Venta COP'),	_('Compra USD'), 'Comision %',
		_('A pagar USD'));

    $params =   array( 	0 => $comments,
	    				1 => array(  'text' => _('Period'), 'from' => $from, 'to' => $to),
	    				2 => array(  'text' => _('Category'), 'from' => $cat,'to' => ''),
	    				3 => array(  'text' => _('Customer'), 'from' => $cust, 'to' => ''),
	    				4 => array(  'text' => _('Supplier'), 'from' => $froms, 'to' => ''),
	    				5 => array(  'text' => _('Selection'),'from' => $back,'to' => ''));

	$aligns2 = $aligns;

	$rep = new FrontReport(_('Reporte de Ventas-Compra con Comision'), "SalesVrsPurchases", user_pagesize(), 9, $orientation);
    if ($orientation == 'L')
    	recalculate_cols($cols);
	$cols2 = $cols;
	$rep->Font();
	//$rep->Info($params, $cols, $headers, $aligns, $cols2, $headers2, $aligns2);
	$rep->Info($params, $cols, $headers, $aligns, $cols2, null, $aligns2);

	$rep->NewPage();
	$orderno = 0;
    $total = $totalC = $totalP = 0.0;
    $totalFact = $totalCompra = $totalPagar = 0.0;

	$result = GetSalesInvoices($from, $to, 0, NULL, $fromsupp, $fromcust);

	while ($myrow=db_fetch($result))
	{
		$rep->NewLine(0, 2, false, $orderno);
		if ($orderno != $myrow['reference'])
		{
			if ($orderno != 0)
			{
				$rep->Line($rep->row);
				$rep->NewLine();
				$rep->TextCol(2, 3,	_('Total'));
            	$rep->AmountCol(3, 4, $totalFact, $dec);
            	$rep->AmountCol(4, 5, $totalCompra, $dec);
            	$rep->AmountCol(6, 7, $totalPagar, $dec);
            	$totalFact = $totalCompra = $totalPagar = 0.0;
				$rep->NewLine();
				$rep->Line($rep->row);
				$rep->NewLine();
			}
			$rep->TextCol(0, 1,	'Factura #');
			//$rep->TextCol(1, 2,	$myrow['debtor_no'].'-'.get_customer_name($myrow['debtor_no']));
			$rep->TextCol(1, 2,	$myrow['reference']);
			$rep->NewLine();
			//$rep->TextCol(2, 3,	get_branch_name($myrow['branch_code']));
			$rep->TextCol(0, 1,	'Fecha:');
			$rep->DateCol(1, 2,	$myrow['tran_date'], true);
            $dec = get_qty_dec($myrow['stock_id']);
            //$rep->AmountCol(3, 4, $myrow['ov_amount'], $dec);
			$rep->DateCol(4, 5,	'');
			//$rep->DateCol(5, 6,	$myrow['due_date'], true);
			$rep->TextCol(5, 6,	'');
            $rep->TextCol(6, 7, '');
			//$rep->TextCol(6, 7,	$myrow['ov_amount']);
			$rep->NewLine(2);
			$orderno = $myrow['reference'];
		}
// JAFU: show pictures		if ($pictures)
		
			$image = company_path(). "/images/"
				. item_img_name($myrow['stock_id']) . ".jpg";
			if (file_exists($image))
			{
				//$rep->NewLine();
				//if ($rep->row - $pic_height < $rep->bottomMargin)
				//	$rep->NewPage();
//				$rep->AddImage($image, $rep->cols[0], $rep->row - $pic_height-60, 0, $pic_height+45);
//				$rep->row -= $pic_height + 10;
				$rep->AddImage($image, $rep->cols[0], $rep->row - 20, 0, $pic_height-21);
				$rep->row -= $pic_height - 30;
				//$rep->NewLine();
			}
// 		

                $rep->TextCol(1, 2,	$myrow['stock_id']);
		$rep->TextCol(2, 3,	$myrow['debtor_no'].'-'.get_customer_name($myrow['debtor_no']));
		$dec = get_qty_dec($myrow['stock_id']);
		$rep->AmountCol(3, 4, $myrow['unit_price'], $dec);
		$rep->AmountCol(4, 5, $myrow['price'], $dec);
		$rep->TextCol(5, 6,	$myrow['comision']*100);
		$rep->AmountCol(6, 7, $myrow['valor_proveedor'], $dec);

                $total += $myrow['unit_price'];
                $totalC += $myrow['price'];
                $totalP += $myrow['valor_proveedor'];

		//$rep->AmountCol(4, 5, $myrow['quantity'] - $myrow['qty_sent'], $dec);
                //$rep->TextCol(5, 6, $myrow['facturado']);
		//if ($myrow['quantity'] - $myrow['qty_sent'] > 0)
                //if (!$myrow['facturado'])
		//{
		//	$rep->Font('italic');
		//	$rep->TextCol(5, 6,	_('Outstanding'));
		//	$rep->Font();
		//}
        $totalFact 	 += $myrow['unit_price'];
        $totalCompra += $myrow['price'];
        $totalPagar  += $myrow['valor_proveedor'];

		$rep->NewLine();

	}

        $rep->Line($rep->row);
	$rep->NewLine();
        $rep->TextCol(0, 1, _('TOTAL'));
        $rep->AmountCol(3, 4, $total, $dec);
        $rep->AmountCol(4, 5, $totalC, $dec);
        $rep->AmountCol(6, 7, $totalP, $dec);
	$rep->End();
}

?>