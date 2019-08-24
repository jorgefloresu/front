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
$page_security = 'SA_SUPPPAYMREP';
// ----------------------------------------------------------------
// $ Revision:	2.0 $
// Creator:	Joe Hunt
// date_:	2005-05-19
// Title:	Inventory Sales Report
// ----------------------------------------------------------------
$path_to_root="..";

include_once($path_to_root . "/includes/session.inc");
include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/data_checks.inc");
include_once($path_to_root . "/includes/banking.inc");
include_once($path_to_root . "/gl/includes/gl_db.inc");
include_once($path_to_root . "/inventory/includes/db/items_category_db.inc");

//----------------------------------------------------------------------------------------------------

print_inventory_purchase();

function getTransactions($category, $location, $fromsupp, $item, $from, $to)
{
	$from = date2sql($from);
	$to = date2sql($to);
/*        $sql = "SELECT ".TB_PREF."stock_master.category_id,
			".TB_PREF."stock_category.description AS cat_description,
			".TB_PREF."stock_master.stock_id,
			".TB_PREF."stock_master.description, 
			".TB_PREF."supp_invoice_items.supp_trans_no,
			".TB_PREF."suppliers.supplier_id,
			".TB_PREF."suppliers.supp_name AS supplier_name,
			".TB_PREF."supp_trans.tran_date,
			".TB_PREF."supp_invoice_items.quantity AS qty,
			(ABS(".TB_PREF."supp_trans.alloc)) AS price,
			(ABS(".TB_PREF."supp_trans.ov_discount)) AS descuento,
			(ABS(".TB_PREF."supp_trans.alloc) - ABS(".TB_PREF."supp_trans.ov_discount)) AS comision
		FROM ".TB_PREF."stock_master,
			".TB_PREF."stock_category,
			".TB_PREF."suppliers,
			".TB_PREF."supp_invoice_items,
			".TB_PREF."supp_trans
		WHERE ".TB_PREF."supp_trans.supplier_id=".TB_PREF."suppliers.supplier_id
		AND ".TB_PREF."supp_trans.trans_no=".TB_PREF."supp_invoice_items.supp_trans_no
		AND ".TB_PREF."supp_invoice_items.stock_id=".TB_PREF."stock_master.stock_id
		AND ".TB_PREF."stock_master.category_id=".TB_PREF."stock_category.category_id
		AND ".TB_PREF."supp_trans.type=22
		AND ".TB_PREF."supp_trans.tran_date>='$from'
		AND ".TB_PREF."supp_trans.tran_date<='$to'
		AND ".TB_PREF."stock_master.mb_flag='B'";
		if ($category != 0)
			$sql .= " AND ".TB_PREF."stock_master.category_id = ".db_escape($category);
		if ($location != '')
			$sql .= " AND ".TB_PREF."stock_moves.loc_code = ".db_escape($location);
		if ($fromsupp != '')
			$sql .= " AND ".TB_PREF."suppliers.supplier_id = ".db_escape($fromsupp);
		if ($item != '')
			$sql .= " AND ".TB_PREF."stock_master.stock_id = ".db_escape($item);
		$sql .= " ORDER BY ".TB_PREF."stock_master.category_id,
			".TB_PREF."suppliers.supp_name, ".TB_PREF."stock_master.stock_id, ".TB_PREF."supp_trans.tran_date";
 * 
 * JAFU: query based on suppliers delivery date 
	$sql = "SELECT ".TB_PREF."stock_master.category_id,
			".TB_PREF."stock_category.description AS cat_description,
			".TB_PREF."stock_master.stock_id,
			".TB_PREF."stock_master.description,".TB_PREF."stock_master.long_description, 
                        ".TB_PREF."stock_master.inactive,
			".TB_PREF."stock_moves.loc_code,
			".TB_PREF."suppliers.supplier_id,
			".TB_PREF."suppliers.supp_name AS supplier_name,
			".TB_PREF."stock_moves.tran_date,
			".TB_PREF."stock_moves.qty AS qty,
			".TB_PREF."stock_moves.price*(1-".TB_PREF."stock_moves.discount_percent) AS price,
                        ".TB_PREF."stock_moves.price*".TB_PREF."suppliers.supp_account_no AS comision
		FROM ".TB_PREF."stock_master,
			".TB_PREF."stock_category,
			".TB_PREF."suppliers,
			".TB_PREF."stock_moves
		WHERE ".TB_PREF."stock_master.stock_id=".TB_PREF."stock_moves.stock_id
		AND ".TB_PREF."stock_master.category_id=".TB_PREF."stock_category.category_id
		AND ".TB_PREF."stock_moves.person_id=".TB_PREF."suppliers.supplier_id
		AND ".TB_PREF."stock_moves.tran_date>='$from'
		AND ".TB_PREF."stock_moves.tran_date<='$to'
		AND (".TB_PREF."stock_moves.type=".ST_SUPPRECEIVE." OR ".TB_PREF."stock_moves.type=".ST_SUPPCREDIT.")
		AND (".TB_PREF."stock_master.mb_flag='B' OR ".TB_PREF."stock_master.mb_flag='M') 
                AND (".TB_PREF."stock_master.stock_id IN (SELECT ".TB_PREF."stock_moves.stock_id FROM ".TB_PREF."stock_moves WHERE ".TB_PREF."stock_moves.type=".ST_CUSTDELIVERY."))";
		if ($category != 0)
			$sql .= " AND ".TB_PREF."stock_master.category_id = ".db_escape($category);
		if ($location != '')
			$sql .= " AND ".TB_PREF."stock_moves.loc_code = ".db_escape($location);
		if ($fromsupp != '')
			$sql .= " AND ".TB_PREF."suppliers.supplier_id = ".db_escape($fromsupp);
		if ($item != '')
			$sql .= " AND ".TB_PREF."stock_master.stock_id = ".db_escape($item);
		$sql .= " ORDER BY ".TB_PREF."stock_master.category_id,
			".TB_PREF."suppliers.supp_name, ".TB_PREF."stock_moves.tran_date, ".TB_PREF."stock_master.stock_id";

        $sql = "SELECT DISTINCT ".TB_PREF."suppliers.supp_name AS supplier_name, 
                result.*, 
                ".TB_PREF."purch_data.price, 
                round(".TB_PREF."purch_data.price * ".TB_PREF."suppliers.supp_account_no,2) AS comision 
                FROM (
                        SELECT ".TB_PREF."stock_master.category_id, 
                            ".TB_PREF."stock_category.description AS cat_description, 
                            ".TB_PREF."stock_master.stock_id, 
                            ".TB_PREF."stock_master.description,
                            ".TB_PREF."stock_master.long_description, 
                            ".TB_PREF."stock_master.inactive, 
                            ".TB_PREF."stock_moves.loc_code, 
                            (SELECT distinct sm.person_id 
                                FROM ".TB_PREF."stock_moves sm 
                                WHERE sm.type=25 
                                AND sm.stock_id=".TB_PREF."stock_master.stock_id) AS supplier_idx,
                            ".TB_PREF."stock_moves.tran_date, 
                            ".TB_PREF."stock_moves.qty AS qty, 
                            ".TB_PREF."stock_moves.price AS price_orig
                        FROM ".TB_PREF."stock_master, ".TB_PREF."stock_category, ".TB_PREF."stock_moves 
                        WHERE ".TB_PREF."stock_master.stock_id=".TB_PREF."stock_moves.stock_id 
                        AND ".TB_PREF."stock_master.category_id=".TB_PREF."stock_category.category_id 
                        AND ".TB_PREF."stock_moves.tran_date>='$from' 
                        AND ".TB_PREF."stock_moves.tran_date<='$to' 
                        AND ".TB_PREF."stock_moves.type=".ST_CUSTDELIVERY." 
                        AND (".TB_PREF."stock_master.mb_flag='B' OR ".TB_PREF."stock_master.mb_flag='M')) AS result, ".TB_PREF."suppliers, ".TB_PREF."purch_data                       
                WHERE result.supplier_idx = ".TB_PREF."suppliers.supplier_id 
                AND result.stock_id=".TB_PREF."purch_data.stock_id";
*/
        $sql = "SELECT  ".TB_PREF."suppliers.supp_name as supplier_name,
		".TB_PREF."stock_master.category_id, 
                ".TB_PREF."stock_category.description AS cat_description,
		".TB_PREF."debtor_trans_details.stock_id,
                ".TB_PREF."stock_master.description,
                ".TB_PREF."stock_master.long_description,
                ".TB_PREF."suppliers.supplier_id as supplier_idx,
		".TB_PREF."debtor_trans.reference as supp_reference,
		".TB_PREF."debtor_trans.tran_date,
		".TB_PREF."debtor_trans.ov_amount,
		".TB_PREF."debtor_trans_details.unit_price as price_orig, 
                ".TB_PREF."purch_data.price,
                round(".TB_PREF."purch_data.price * ".TB_PREF."suppliers.supp_account_no,2) as comision
		FROM ".TB_PREF."debtor_trans, ".TB_PREF."debtor_trans_details, ".TB_PREF."purch_data, ".TB_PREF."suppliers, ".TB_PREF."stock_master, ".TB_PREF."stock_category 
		WHERE ".TB_PREF."debtor_trans.trans_no = ".TB_PREF."debtor_trans_details.debtor_trans_no
			AND ".TB_PREF."debtor_trans.type = ".TB_PREF."debtor_trans_details.debtor_trans_type
                        AND ".TB_PREF."debtor_trans_details.stock_id = ".TB_PREF."purch_data.stock_id
                        AND ".TB_PREF."purch_data.supplier_id = ".TB_PREF."suppliers.supplier_id
                        AND ".TB_PREF."debtor_trans_details.stock_id = ".TB_PREF."stock_master.stock_id
                        AND ".TB_PREF."stock_master.category_id = ".TB_PREF."stock_category.category_id
			AND ".TB_PREF."debtor_trans.tran_date >='$from'
                        AND ".TB_PREF."debtor_trans.tran_date <='$to'
			AND ".TB_PREF."debtor_trans.type=".ST_SALESINVOICE."
			AND ".TB_PREF."debtor_trans.ov_amount>0";
        
		if ($category != 0)
			$sql .= " AND category_id = ".db_escape($category);
		if ($fromsupp != '')
			$sql .= " AND ".TB_PREF."purch_data.supplier_id = ".db_escape($fromsupp);
		if ($item != '')
			$sql .= " AND stock_id = ".db_escape($item);

                $sql .= " ORDER BY category_id, supplier_name, tran_date, stock_id";

return db_query($sql,"No transactions were returned");

}

function get_supp_inv_reference($supplier_id, $stock_id, $date)
{
	$sql = "SELECT ".TB_PREF."supp_trans.supp_reference
		FROM ".TB_PREF."supp_trans,
			".TB_PREF."supp_invoice_items,
			".TB_PREF."grn_batch,
			".TB_PREF."grn_items
		WHERE ".TB_PREF."supp_trans.type=".TB_PREF."supp_invoice_items.supp_trans_type
		AND ".TB_PREF."supp_trans.trans_no=".TB_PREF."supp_invoice_items.supp_trans_no
		AND ".TB_PREF."grn_items.grn_batch_id=".TB_PREF."grn_batch.id
		AND ".TB_PREF."grn_items.item_code=".TB_PREF."supp_invoice_items.stock_id
		AND ".TB_PREF."supp_trans.supplier_id=".db_escape($supplier_id)."
		AND ".TB_PREF."supp_invoice_items.stock_id=".db_escape($stock_id)."
		AND ".TB_PREF."supp_trans.tran_date=".db_escape($date);
    $result = db_query($sql,"No transactions were returned");
    $row = db_fetch_row($result);
    if (isset($row[0]))
    	return $row[0];
    else
    	return '';
}    

function get_cust_inv_reference($stock_id)
{
	$sql = "SELECT ".TB_PREF."refs.reference
                FROM ".TB_PREF."debtor_trans_details,  ".TB_PREF."refs
                WHERE ".TB_PREF."debtor_trans_details.debtor_trans_no = ".TB_PREF."refs.id
                AND ".TB_PREF."debtor_trans_details.debtor_trans_type = ".TB_PREF."refs.type
                AND ".TB_PREF."debtor_trans_details.debtor_trans_type=".ST_SALESINVOICE."
                AND ".TB_PREF."debtor_trans_details.stock_id=".db_escape($stock_id)."
                AND NOT EXISTS(
                    SELECT * FROM ".TB_PREF."voided 
                    WHERE ".TB_PREF."voided.type=".TB_PREF."refs.type 
                    AND ".TB_PREF."voided.id=".TB_PREF."refs.id)";
    $result = db_query($sql,"No transactions were returned");
    $row = db_fetch_row($result);
    if (isset($row[0]))
    	return $row[0];
    else
    	return '';
}    
	
//----------------------------------------------------------------------------------------------------

function print_inventory_purchase()
{
    global $path_to_root, $pic_height, $pic_width;

	$from = $_POST['PARAM_0'];
	$to = $_POST['PARAM_1'];       
    $category = $_POST['PARAM_2'];
    $location = $_POST['PARAM_3'];
    $fromsupp = $_POST['PARAM_4'];
    $item = $_POST['PARAM_5'];
    $curr_pesos = $_POST['PARAM_6'];
        $currency = $_POST['PARAM_7'];
	$comments = $_POST['PARAM_8'];
	$orientation = $_POST['PARAM_9'];
	$destination = $_POST['PARAM_10'];
	if ($destination)
		include_once($path_to_root . "/reporting/includes/excel_report.inc");
	else
		include_once($path_to_root . "/reporting/includes/pdf_report.inc");

	$orientation = ($orientation ? 'L' : 'P');
    $dec = user_price_dec();

	if ($category == ALL_NUMERIC)
		$category = 0;
	if ($category == 0)
		$cat = _('All');
	else
		$cat = get_category_name($category);

	if ($location == '')
		$loc = _('All');
	else
		$loc = get_location_name($location);

	if ($fromsupp == '')
		$froms = _('All');
	else
		$froms = get_supplier_name($fromsupp);

	if ($item == '')
		$itm = _('All');
	else
		$itm = $item;

	//$cols = array(0, 60, 180, 225, 275, 400, 420, 465,	520);
	$cols = array(0, 60, 225, 270, 320, 400, 420, 465,	520);

	//$headers = array(_('Category'), _('Description'), _('Date'), _('#'), _('Supplier'), _('Qty'), _('Unit Price'), _('Total'));
        if (!$curr_pesos) {
            //$currency = 1;
            $headers = array(_('Category'), _('Description'), _('Date'), _('#'), _('Supplier'), _(' '), _('Price(USD) '), _(' Comision(USD)'));
        }
        else {
            $headers = array(_('Category'), _('Description'), _('Date'), _('#'), _('Supplier'), _(' '), _('Price(COP) '), _(' Comision(COP)'));
        }
            if ($fromsupp != '')
		$headers[4] = '';

	$aligns = array('left',	'left',	'left', 'left', 'left', 'left', 'right', 'right');

    $params =   array( 	0 => $comments,
    				    1 => array('text' => _('Supplier'), 'from' => $froms, 'to' => ''),
    				    2 => array('text' => _('Category'), 'from' => $cat, 'to' => ''),
    				    3 => array('text' => _('Location'), 'from' => $loc, 'to' => ''),
    				    2 => array('text' => _('Period'),'from' => $from, 'to' => $to),
    				    3 => array('text' => _('Item'), 'from' => $itm, 'to' => ''));

    $rep = new FrontReport(_('Sales Summary Report'), "InventoryPurchasingReport", user_pagesize(), 9, $orientation);
    if ($orientation == 'L')
    	recalculate_cols($cols);

    $rep->Font();
    $rep->Info($params, $cols, $headers, $aligns);
    $rep->NewPage();

	$res = getTransactions($category, $location, $fromsupp, $item, $from, $to);

	$total = $total_supp = $total_unit = $total_unit2 = $total_unit3 = $grandtotal = 0.0;
	$total_qty = 0.0;
	$catt = $stock_description = $stock_id = $supplier_name = '';
	while ($trans=db_fetch($res))
	{
            //$trans['supp_reference'] = get_cust_inv_reference($trans['stock_id']);
            if ($trans['supp_reference'] != '') 
            {
	/*	if ($stock_description != $trans['description'])
		{
			if ($stock_description != '')
			{
				if ($supplier_name != '')
				{
					$rep->NewLine(2, 3);
					$rep->TextCol(0, 1, _('Total'));
					$rep->TextCol(1, 4, $stock_description);
					$rep->TextCol(4, 5, $supplier_name);
					$rep->AmountCol(5, 7, $total_qty, get_qty_dec($stock_id));
                                        $rep->AmountCol(6, 7, $total_unit, $dec);
					$rep->AmountCol(7, 8, $total_supp, $dec);
					$rep->Line($rep->row - 2);
					$rep->NewLine();
					$total_supp = $total_unit = $total_qty = 0.0;
					$supplier_name = $trans['supplier_name'];
				}	
			}
			$stock_id = $trans['stock_id'];
			$stock_description = $trans['description'];
		}
                */
		if ($supplier_name != $trans['supplier_name'])
		{
			if ($supplier_name != '')
			{
				$rep->NewLine(2, 3);
				$rep->TextCol(0, 1, _('Total'));
				$rep->TextCol(1, 4, $stock_description);
				$rep->TextCol(4, 5, $supplier_name);
				//$rep->AmountCol(5, 7, $total_qty, get_qty_dec($stock_id));
                                $rep->AmountCol(6, 7, $total_unit, $dec);
				$rep->AmountCol(7, 8, $total_supp, $dec);
				$rep->Line($rep->row - 2);
				$rep->NewLine();
				$total_supp = $total_unit = $total_qty = 0.0;
			}
			$supplier_name = $trans['supplier_name'];
		}
		if ($catt != $trans['cat_description']) //if ($catt != $trans['cat_description'])
		{
			if ($catt != '')
			{
				$rep->NewLine(2, 3);
				$rep->TextCol(0, 1, _('Total'));
				$rep->TextCol(1, 7, $catt);
                                $rep->AmountCol(6, 7, $total_unit3, $dec);
				$rep->AmountCol(7, 8, $total, $dec);
				$rep->Line($rep->row - 2);
				$rep->NewLine();
				$rep->NewLine();
				$total = $total_unit3 = 0.0;
			}
			$rep->TextCol(0, 1, $trans['category_id']);
			$rep->TextCol(1, 6, $trans['cat_description']);
			$catt = $trans['cat_description'];
			$rep->NewLine();
		}
		
		$curr = get_supplier_currency($trans['supplier_idx']);
		$rate = get_exchange_rate_from_home_currency($curr, sql2date($trans['tran_date']));
		//$trans['price'] *= $rate;
		$rep->NewLine();
		//$trans['supp_reference'] = get_supp_inv_reference($trans['supplier_id'], $trans['stock_id'], $trans['tran_date']);
                //$trans['supp_reference'] = $trans['supp_trans_no'];
       		//$trans['supp_reference'] = get_cust_inv_reference($trans['stock_id']);
                if ($trans['supp_reference'] == '') $trans['price'] = 0;

		$rep->fontSize -= 2;
// JAFU: show pictures		if ($pictures)
		
			$image = company_path(). "/images/"
				. item_img_name($trans['stock_id']) . ".jpg";
			if (file_exists($image))
			{
				//$rep->NewLine();
				//if ($rep->row - $pic_height < $rep->bottomMargin)
				//	$rep->NewPage();
//				$rep->AddImage($image, $rep->cols[0], $rep->row - $pic_height-60, 0, $pic_height+45);
//				$rep->row -= $pic_height + 10;
				$rep->AddImage($image, $rep->cols[0], $rep->row - $pic_height + 10, 0, $pic_height-21);
				$rep->row -= $pic_height - 40;
				//$rep->NewLine();
			}
// 		

                $rep->TextCol(0, 1, $trans['stock_id']);
                
		if ($fromsupp == ALL_TEXT)
		{
                        $oldrow = $rep->row;
                        if ($trans['cat_description'] == "Right Managed")
                            $rep->TextColLines(1, 2, $trans['long_description'].($trans['inactive']==1 ? " ("._("Inactive").")" : ""), -1);
                        else {
                            $rep->TextColLines(1, 2, $trans['description'].($trans['inactive']==1 ? " ("._("Inactive").")" : ""), -1);
                        }
                        $newrow = $rep->row - 2;
			$rep->row = $oldrow;
			$rep->TextCol(2, 3, sql2date($trans['tran_date']));
			$rep->TextCol(3, 4, $trans['supp_reference']);
			$rep->TextCol(4, 5, $trans['supplier_name']);
		}
		else
		{
			$oldrow = $rep->row;
                        if ($trans['cat_description'] == "Right Managed")
                            $rep->TextColLines(1, 2, $trans['long_description'].($trans['inactive']==1 ? " ("._("Inactive").")" : ""), -1);
                        else {
                            $rep->TextColLines(1, 2, $trans['description'].($trans['inactive']==1 ? " ("._("Inactive").")" : ""), -1);
                        }    
                        $newrow = $rep->row;
			$rep->row = $oldrow;
			$rep->TextCol(2, 3, sql2date($trans['tran_date']));
			$rep->TextCol(3, 4, $trans['supp_reference']);
		}
		//$rep->AmountCol(5, 6, $trans['qty'], get_qty_dec($trans['stock_id']));
                if ($curr_pesos)
                    if ($curr == 'COP'){
                        $price = $trans['price'];
                        $amt = $trans['comision'];
                    }
                    else {
                        $price = $trans['price'] * $rate;//$currency;
                        $amt = $trans['comision'] * $rate;//$currency ; //$amt = $trans['qty'] * $trans['price'];
                    }
                else {
                        $price = $trans['price'];
                        $amt = $trans['comision'];
                }    
                $rep->AmountCol(6, 7, $price, $dec);
		$rep->AmountCol(7, 8, $amt, $dec);
		$rep->fontSize += 2;
		$total += $amt;
                $total_unit2 += $price;
                $total_unit3 += $price;
		$total_supp += $amt;
                $total_unit += $price;
		$grandtotal += $amt;
		$total_qty += $trans['qty'];
                $rep->row -= 40;
            }
	}
/*	if ($stock_description != '')
	{
		if ($supplier_name != '')
		{
			$rep->NewLine(2, 3);
			$rep->TextCol(0, 1, _('Total'));
			$rep->TextCol(1, 4, $stock_description);
			$rep->TextCol(4, 5, $supplier_name);
			$rep->AmountCol(5, 7, $total_qty, get_qty_dec($stock_id));
                        $rep->AmountCol(6, 7, $total_unit, $dec);
			$rep->AmountCol(7, 8, $total_supp, $dec);
			$rep->Line($rep->row - 2);
			$rep->NewLine();
			$rep->NewLine();
			$total_supp = $total_unit = $total_qty = 0.0;
			$supplier_name = $trans['supplier_name'];
		}	
	}*/
	if ($supplier_name != '')
	{
		$rep->NewLine(2, 3);
		$rep->TextCol(0, 1, _('Total'));
		$rep->TextCol(1, 4, $stock_description);
		$rep->TextCol(4, 5, $supplier_name);
		//$rep->AmountCol(5, 7, $total_qty, get_qty_dec($stock_id));
                $rep->AmountCol(6, 7, $total_unit, $dec);
		$rep->AmountCol(7, 8, $total_supp, $dec);
		$rep->Line($rep->row - 2);
		$rep->NewLine();
		$rep->NewLine();
	}

	$rep->NewLine(2, 3);
	$rep->TextCol(0, 1, _('Total'));
	$rep->TextCol(1, 6, $catt);
        $rep->AmountCol(6, 7, $total_unit3, $dec);
	$rep->AmountCol(7, 8, $total, $dec);
	$rep->Line($rep->row - 2);
	$rep->NewLine();
	$rep->NewLine(2, 1);
	$rep->TextCol(0, 7, _('Grand Total'));
        $rep->AmountCol(6, 7, $total_unit2, $dec);
	$rep->AmountCol(7, 8, $grandtotal, $dec);

	$rep->Line($rep->row  - 4);
	$rep->NewLine();
    $rep->End();
}

?>