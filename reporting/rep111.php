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
$page_security = $_POST['PARAM_0'] == $_POST['PARAM_1'] ?
	'SA_SALESTRANSVIEW' : 'SA_SALESBULKREP';
// ----------------------------------------------------------------
// $ Revision:	2.0 $
// Creator:	Joe Hunt
// date_:	2005-05-19
// Title:	Print Sales Quotations
// ----------------------------------------------------------------
$path_to_root="..";

include_once($path_to_root . "/includes/session.inc");
include_once($path_to_root . "/includes/date_functions.inc");
include_once($path_to_root . "/includes/data_checks.inc");
include_once($path_to_root . "/sales/includes/sales_db.inc");
include_once($path_to_root . "/taxes/tax_calc.inc");

//----------------------------------------------------------------------------------------------------

print_sales_quotations();

function print_sales_quotations()
{
    // JAFU : add pic data
	global $path_to_root, $print_as_quote, $print_invoice_no, $no_zero_lines_amount, $pic_height, $pic_width;

	include_once($path_to_root . "/reporting/includes/pdf_report.inc");

	$from = $_POST['PARAM_0'];
	$to = $_POST['PARAM_1'];
	$currency = $_POST['PARAM_2'];
	$email = $_POST['PARAM_3'];
	$comments = $_POST['PARAM_4'];
	$orientation = $_POST['PARAM_5'];

	if (!$from || !$to) return;

	$orientation = ($orientation ? 'L' : 'P');
	$dec = user_price_dec();

	$cols = array(4, 60, 290, 300, 325, 385, 450, 515);

	// $headers in doctext.inc
	$aligns = array('left',	'left',	'right', 'right', 'right', 'right', 'right');

	$params = array('comments' => $comments);

	$cur = get_company_Pref('curr_default');

	if ($email == 0)
		$rep = new FrontReport(_("SALES QUOTATION"), "SalesQuotationBulk", user_pagesize(), 9, $orientation);
    if ($orientation == 'L')
    	recalculate_cols($cols);

	for ($i = $from; $i <= $to; $i++)
	{
		$myrow = get_sales_order_header($i, ST_SALESQUOTE);
		$baccount = get_default_bank_account($myrow['curr_code']);
		$params['bankaccount'] = $baccount['id'];
		$branch = get_branch($myrow["branch_code"]);
		if ($email == 1)
		{
			$rep = new FrontReport("", "", user_pagesize(), 9, $orientation);
			if ($print_invoice_no == 1)
				$rep->filename = "SalesQuotation" . $i . ".pdf";
			else
				$rep->filename = "SalesQuotation" . $myrow['reference'] . ".pdf";
		}
		$rep->SetHeaderType('Header2');
		$rep->currency = $cur;
		$rep->Font();
		$rep->Info($params, $cols, null, $aligns);

		$contacts = get_branch_contacts($branch['branch_code'], 'order', $branch['debtor_no'], true);
		$rep->SetCommonData($myrow, $branch, $myrow, $baccount, ST_SALESQUOTE, $contacts);
		//$rep->headerFunc = 'Header2';
		$rep->NewPage();

		$result = get_sales_order_details($i, ST_SALESQUOTE);
		$SubTotal = 0;
		$items = $prices = array();
		while ($myrow2=db_fetch($result))
		{
			$Net = round2(((1 - $myrow2["discount_percent"]) * $myrow2["unit_price"] * $myrow2["quantity"]),
			   user_price_dec());
			$prices[] = $Net;
			$items[] = $myrow2['stk_code'];
			$SubTotal += $Net;
			$DisplayPrice = number_format2($myrow2["unit_price"],$dec);
			$DisplayQty = number_format2($myrow2["quantity"],get_qty_dec($myrow2['stk_code']));
			$DisplayNet = number_format2($Net,$dec);
			if ($myrow2["discount_percent"]==0)
				$DisplayDiscount ="";
			else
				$DisplayDiscount = number_format2($myrow2["discount_percent"]*100,user_percent_dec()) . "%";
			//$rep->TextCol(0, 1,	$myrow2['stk_code'], -2);
			$oldrow = $rep->row;
			$rep->TextColLines(1, 2, $myrow2['description'].' - '.$myrow2['long_description'], -2);
			$newrow = $rep->row;
			$rep->row = $oldrow;
			if ($Net != 0.0 || !is_service($myrow2['mb_flag']) || !isset($no_zero_lines_amount) || $no_zero_lines_amount == 0)
			{
				//$rep->TextCol(2, 3,	$DisplayQty, -2);
				$rep->TextCol(3, 4,	$myrow2['units'], -2);
				$rep->TextCol(4, 5,	$DisplayPrice, -2);
				$rep->TextCol(5, 6,	$DisplayDiscount, -2);
				$rep->TextCol(6, 7,	$DisplayNet, -2);
			}
// JAFU: show pictures		if ($pictures)

			$image = company_path(). "/images/"
				. item_img_name($myrow2['stk_code']) . ".jpg";
			if (file_exists($image))
			{
				//$rep->NewLine();
				//if ($rep->row - $pic_height < $rep->bottomMargin)
				//	$rep->NewPage();
				$rep->AddImage($image, $rep->cols[0], $rep->row - $pic_height+19, 0, $pic_height-21);
				$rep->row -= $pic_height + 25;
				//$rep->NewLine();
			}
//
//			$rep->row = $newrow;
			//$rep->NewLine(1);
			if ($rep->row < $rep->bottomMargin + (20 * $rep->lineHeight)) {
				$image = company_path(). "/images/sign.png";

				//$rep->AddImage($image, 59, $rep->row - $pic_height-52, 0, $pic_height-15);
				$rep->AddImage($image, 59, $rep->bottomMargin+7, 0, $pic_height-15);
				$rep->NewPage();
		
			}
		}
		if ($myrow['comments'] != "")
		{
			$rep->row = $newrow;
                        $rep->NewLine();
			$rep->TextColLines(1, 6, $myrow['comments'], -2);
		}
		$DisplaySubTot = number_format2($SubTotal,$dec);
		$DisplayFreight = number_format2($myrow["freight_cost"],$dec);


		$tax_items = get_tax_for_items($items, $prices, $myrow["freight_cost"],
		  $myrow['tax_group_id'], $myrow['tax_included'],  null);
		$first = true;

		$count_taxes = 0;
		foreach ($tax_items as $tax_item) {
			if (abs($tax_item['Value']) > 0)
				$count_taxes += 1;
		}
		$total_margin = round(($count_taxes/$rep->lineHeight)*80);

		//$rep->row = $rep->bottomMargin + ($total_margin * $rep->lineHeight);
		$rep->row = $rep->bottomMargin + 190 + $total_margin;
		$doctype = ST_SALESQUOTE;

		$rep->TextCol(3, 6, _("Sub-total"), -2);
		$rep->TextCol(6, 7,	$DisplaySubTot, -2);
		$rep->NewLine(2);
		//$rep->TextCol(3, 6, _("Shipping"), -2);
		//$rep->TextCol(6, 7,	$DisplayFreight, -2);
		//$rep->NewLine();

		$DisplayTotal = number_format2($myrow["freight_cost"] + $SubTotal, $dec);
		//if ($myrow['tax_included'] == 0) {
		//	$rep->TextCol(3, 6, _("TOTAL ORDER EX VAT"), - 2);
		//	$rep->TextCol(6, 7,	$DisplayTotal, -2);
		//	$rep->NewLine();
		//}
		foreach($tax_items as $tax_item)
		{
			if ($tax_item['Value'] == 0)
				continue;
			$DisplayTax = number_format2($tax_item['Value'], $dec);

			$tax_type_name = $tax_item['tax_type_name'];

			if ($myrow['tax_included'])
			{
				if (isset($alternative_tax_include_on_docs) && $alternative_tax_include_on_docs == 1)
				{
					if ($first)
					{
						$rep->TextCol(3, 6, _("Total Tax Excluded"), -2);
						$rep->TextCol(6, 7,	number_format2($sign*$tax_item['net_amount'], $dec), -2);
						$rep->NewLine();
					}
					$rep->TextCol(3, 6, $tax_type_name, -2);
					$rep->TextCol(6, 7,	$DisplayTax, -2);
					$first = false;
				}
				else
					$rep->TextCol(3, 7, _("Included") . " " . $tax_type_name . " " . _("Amount") . ": " . $DisplayTax, -2);
			}
			else
			{
				$SubTotal += $tax_item['Value'];
				$rep->TextCol(3, 6, $tax_type_name, -2);
				$rep->TextCol(6, 7,	$DisplayTax, -2);
			}
			$rep->NewLine();
		}

		$rep->NewLine();

		$DisplayTotal = number_format2($myrow["freight_cost"] + $SubTotal, $dec);
		$rep->Font('bold');
		$rep->TextCol(3, 6, _("TOTAL ORDER VAT INCL."), - 2);
		$rep->TextCol(6, 7,	$DisplayTotal, -2);
		$words = price_in_words(round($myrow["freight_cost"] + $SubTotal,$dec), ST_SALESQUOTE);
                if ($myrow['curr_code'] == 'COP')
                    $words .= ' pesos m/cte';
                else
                    $words .= utf8_decode(' dólares');
		//$words = price_in_words($DisplayTotal, ST_SALESQUOTE, $myrow['curr_code']);
		if ($words != "")
		{
			$rep->row = $rep->bottomMargin + 102;
			//$rep->NewLine(1);
			//$rep->TextCol(1, 7, $myrow['curr_code'] . ": " . $words, - 2);
			$rep->TextCol(0, 6, "Valor en letras: " . $words, - 2);
		}
		$rep->Font();
		if ($email == 1)
		{
			if ($print_invoice_no == 1)
				$myrow['reference'] = $i;
			$rep->End($email);
		}
		$image = company_path(). "/images/sign.png";

		//$rep->AddImage($image, 59, $rep->row - $pic_height-52, 0, $pic_height-15);
		$rep->AddImage($image, 59, $rep->bottomMargin+7, 0, $pic_height-15);
}

        if ($email == 0)
		$rep->End();
}

?>
