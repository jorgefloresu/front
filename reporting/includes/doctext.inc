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
/*****
*
*	Set document type dependent elements of common page layout.
*
*/
/*	$Addr1 = array(
			'title' => _("Charge To"),
			'name' => @$this->formData['br_name'] ? $this->formData['br_name'] : @$this->formData['DebtorName'],
			'address' => @$this->formData['br_address'] ? $this->formData['br_address'] : @$this->formData['address'],
                        'phone' => @$this->contactData[0]['phone']
	);
 * 
 */
	$Addr1 = array(
			'title' => _("Charge To"),
			'name' => @$this->formData['name'] ? $this->formData['name'] : @$this->formData['DebtorName'],
			'address' => @$this->formData['address'],
                        'phone' => @$this->contactData[0]['phone']
	);
	$Addr2 = array(
			'title' => _("Delivered To"),
			'name' => @$this->formData['deliver_to'],
			'address' => @$this->formData['delivery_address']
	);

	// default item column headers
	//$this->headers = array(_("Item Code"), _("Item Description"), _("Quantity"),
	//	_("Unit"), _("Price"), _("Discount %"), _("Total"));
	$this->headers = array(_("Item Code"), _("Item Description"), _("     "),
		_("Unit"), _("Price"), _("Discount %"), _("Total"));

	// for links use 'text' => 'url'
	//$Footer[0] = _("All amounts stated in") . " - " . @$this->formData['curr_code'];

	switch ($this->formData['doctype'])
	{
		case ST_SALESQUOTE:
			$this->title = _("SALES QUOTATION");
			$this->formData['document_name'] =_("Quotation No.");
			$this->formData['document_date'] = $this->formData['ord_date'];
			$this->formData['document_number'] = $print_invoice_no == 0 && isset($this->formData['reference'])
				? $this->formData['reference'] : $this->formData['order_no'];
			$this->formData['domicile'] = $this->company['domicile'];
                        $Footer[0] = _("All amounts stated in") . " - " . $this->formData['curr_code'];
                        $Footer[1] = "                  ";
                        $Footer[2] = "                  ";
                        $Footer[3] = "                  ";
                        
                        $Footer[4] = "                  ";
                        $Footer[5] = "                  ";
                        $Footer[6] = "_______________________________";
                        $Footer[7] = "Carolina Ar".utf8_decode("é")."valo R. Directora General";

                        $aux_info = array(
				_("Customer's Reference") => $this->formData["customer_ref"],
				_("Sales Person") => get_salesman_name($this->formData['salesman']),
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Quotation No") => $this->formData['order_no'],
				_("Valid until") => sql2date($this->formData['delivery_date']),
			);
			break;

		case ST_SALESORDER:
			$this->title = ($print_as_quote==1 ? _("QUOTE") : _("SALES ORDER"));
			$this->formData['document_name'] =_("Order No.");
			$this->formData['document_date'] = $this->formData['ord_date'];
			$this->formData['document_number'] = $print_invoice_no == 0 && isset($this->formData['reference'])
				? $this->formData['reference'] : $this->formData['order_no'];
			$this->formData['document_amount'] = $this->formData['order_no'];

			$aux_info = array(
				_("Customer's Reference") => $this->formData["customer_ref"],
				_("Sales Person") => get_salesman_name($this->formData['salesman']),
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Order No") => $this->formData['order_no'],
				_("Delivery Date") => sql2date($this->formData['delivery_date']),
			);
			break;

		case ST_CUSTDELIVERY:
			$this->title = ($packing_slip==1 ? _("PACKING SLIP") : _("DELIVERY NOTE"));
			$this->formData['document_name'] = _("Delivery Note No.");
			if (@$packing_slip)
				$Payment_Terms = '';
			$ref = $this->formData['order_'];
			if ($print_invoice_no == 0)
			{
				$ref = get_reference(ST_SALESORDER, $this->formData['order_']);
				if (!$ref)
					$ref = $this->formData['order_'];
			}
			$aux_info = array(
				_("Customer's Reference") => $this->formData["customer_ref"],
				_("Sales Person") => get_salesman_name($this->formData['salesman']),
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Order No") => $ref,
				_("To Be Invoiced Before") => sql2date($this->formData['due_date']),
			);
			break;

		case ST_CUSTCREDIT:
			$this->title = _("CREDIT NOTE");
			$this->formData['document_name'] =_("Credit No.");
			$Footer[0] = _("Please quote Credit no. when paying. All amounts stated in") . " - " . $this->formData['curr_code'];

			$aux_info = array(
				_("Customer's Reference") => @$this->formData["customer_ref"],
				_("Sales Person") => get_salesman_name($this->formData['salesman']),
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Order No") => $this->formData['order_'],
				_("Due Date") => '',
			);
			break;

		case ST_SALESINVOICE:
			$this->title = _("FACTURA DE VENTA");
			//$this->title = _("INVOICE");
			$this->formData['document_name'] =_("Invoice No.");
			$this->formData['domicile'] = $this->company['domicile'];
			//$Footer[0] = _("Please quote Invoice no. when paying. All amounts stated in"). " - " . $this->formData['curr_code'];
                        $Footer[0] = utf8_decode("Esta factura es un título valor que se asimila para todos sus efectos a una letra de cambio (según artículos 772, 773, 774 y 775 del código de comercio pagadera");
                        $Footer[1] = utf8_decode("en Bogotá a la orden de LATIN COLOR IMAGES SAS. NIT.900.115.126-9. Después de vencida la Factura, se cobrarán intereses de mora a la tasa máxima");
                        $Footer[2] = utf8_decode("vigente. Si dentro de los cinco(5) días siguientes de recibo de esta factura no ha sido devuelta, se dará por aceptada. El cliente u obligado declara de forma irrevocable e ");
                        $Footer[3] = utf8_decode("incondicional que ha recibido a entera satisfacción los bienes y servicios detallados en la presente factura                                                                        ");
                        
                        $Footer[4] = "                  ";
                        $Footer[5] = "                  ";
                        $Footer[6] = "_______________________________                                                              _________________________";
                        $Footer[7] = "Carolina Ar".utf8_decode("é")."valo R. Directora General                                                                         Firma, Fecha y Sello";
                        //$Footer[8] = "                  ";
                        $Footer[8] = "                                                                                            ".$this->formData['tipo_copia'];
			$deliveries = get_sales_parent_numbers(ST_SALESINVOICE, $this->formData['trans_no']);
			if ($print_invoice_no == 0)
			{
				/*foreach($deliveries as $n => $delivery) {
					$deliveries[$n] = $deliveries[$n] = get_reference(ST_CUSTDELIVERY, $delivery);
				}*/
                                $ref = get_reference(ST_SALESORDER, $this->formData['order_']);
			}
			$aux_info = array(
				_("Customer's Reference") => $this->formData["customer_ref"],
				_("Sales Person") => get_salesman_name($this->formData['salesman']),
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Quotation No") => $ref, /*implode(',', $deliveries),*/
				_("Due Date") => sql2date($this->formData['due_date']),
			);
			break;

		case ST_SUPPAYMENT:
			global $systypes_array;

			$this->title = _("REMITTANCE");
			$this->formData['document_name'] =_("Remittance No.");
			$Addr1['title'] = _("Order To");
			$Addr1['name'] = $this->formData['supp_name'];
			$Addr1['address'] = $this->formData['address'];
			$Addr2['title'] = _("Charge To");
			$Addr2['name'] = '';
			$Addr2['address'] = '';

			$aux_info = array(
				_("Customer's Reference") => $this->formData['supp_account_no'],
				_("Type") =>$systypes_array[$this->formData["type"]],
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Supplier's Reference") => '',
				_("Due Date") => sql2date($this->formData['tran_date']),
			);
			$this->headers = array(_("Trans Type"), _("#"), _("Date"), _("Due Date"), _("Total Amount"), _("Left to Allocate"), _("This Allocation"));
			break;

		case ST_PURCHORDER:
			$this->title = _("PURCHASE ORDER");
			$this->formData['document_name'] = _("Purchase Order No.");
			$Addr1['title'] = _("Order To");
			$Addr1['name'] = $this->formData['supp_name'];
			$Addr1['address'] = $this->formData['address'];
			$Addr2['title'] = _("Deliver To");
			$Addr2['name'] = $this->company['coy_name'];
			//$Addr2['address'] = $this->company['postal_address']; No, don't destroy delivery address!
			$this->formData['document_date'] = $this->formData['ord_date'];
			$this->formData['document_number'] = $print_invoice_no == 0 && isset($this->formData['reference'])
				? $this->formData['reference'] : $this->formData['order_no'];

			$aux_info = array(
				_("Customer's Reference") => $this->formData['order_no'], //$this->formData['supp_account_no'],
				_("Sales Person") => $this->formData['contact'],
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Supplier's Reference") => $this->formData['requisition_no'],
				_("Order Date") => sql2date($this->formData['document_date']),
			);

			$this->headers = array(_("Item Code"), _("Item Description"),
				_("Delivery Date"), _("Quantity"), 	_("Unit"), _("Price"), _("Total"));
			break;

		case ST_CUSTPAYMENT:
			global $systypes_array;

			$this->title = _("RECEIPT");
			$this->formData['document_name'] =_("Receipt No.");
			$Addr1['title'] = _("With thanks from");
			$aux_info = array(
				_("Customer's Reference") => $this->formData["debtor_ref"],
				_("Type") =>$systypes_array[$this->formData["type"]],
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Order No") => $this->formData['order_'],
				_("Due Date") => sql2date($this->formData['tran_date']),
			);
			$this->headers = array(_("Trans Type"), _("#"), _("Date"), _("Due Date"), _("Total Amount"), _("Left to Allocate"), _("This Allocation"));
			break;

		case ST_WORKORDER:
			global $wo_types_array;

			$this->title = _("WORK ORDER");
			$this->formData['document_name'] =_("Work Order No.");
			$this->formData['document_date'] = $this->formData['date_'];
			$this->formData['document_number'] = $this->formData['id'];
			$Addr1['name'] = $this->formData['location_name'];
			$Addr1['address'] = $this->formData['delivery_address'];
			$aux_info = array(
				_("Reference") => $this->formData['wo_ref'],
				_("Type") => $wo_types_array[$this->formData["type"]],
				_("Manufactured Item") => $this->formData["StockItemName"],
				_("Into Location") => $this->formData["location_name"],
				_("Quantity") => $this->formData["units_issued"],
			);
			$Payment_Terms = _("Required By").": ".sql2date($this->formData["required_by"]);
			$this->headers = array(_("Item Code"), _("Item Description"),
				_("From Location"), _("Work Centre"), 	_("Unit Quantity"), _("Total Quantity"), _("Units Issued"));
			unset($Footer[0]);
			break;


		case ST_STATEMENT:
			$this->formData['document_name'] = '';
			$this->formData['domicile'] = $this->company['domicile'];
			$Payment_Terms = '';
			$this->title = _("STATEMENT");
			$aux_info = array(
				_("Customer's Reference") => '',
				_("Sales Person") => '',
				_("Your VAT no.") => $this->formData['tax_id'],
				_("Our Order No") => '',
				_("Delivery Date") => '',
			);
			$this->headers = array(_("Trans Type"), _("#"), _("Date"), _("DueDate"), _("Charges"),
				_("Credits"), _("Allocated"), _("Outstanding"));
	}

	// default values
	if (!isset($this->formData['document_date']))
		$this->formData['document_date'] = $this->formData['tran_date'];

	if (!isset($this->formData['document_number']))
		$this->formData['document_number'] = $print_invoice_no == 0 && isset($this->formData['reference'])
			? $this->formData['reference'] : @$this->formData['trans_no'];

	if (!isset($Payment_Terms))
	{
		$id = $this->formData['payment_terms'];
		$sql = "SELECT terms FROM ".TB_PREF."payment_terms WHERE terms_indicator=".db_escape($id);
		$result = db_query($sql,"could not get paymentterms");
		$row = db_fetch($result);
		$Payment_Terms = _("Payment Terms") . ': ' . $row["terms"];
	}

	// footer generic content
	//if (@$this->formData['bank_name'])
	//	$Footer[] = _("Bank"). ": ".$this->formData['bank_name']. ", " . _("Bank Account") . ": " . $this->formData['bank_account_number'];

	if (@$this->formData['payment_service'])	//payment link
	{
		$amt = number_format($this->formData["ov_freight"] + $this->formData["ov_gst"] + $this->formData["ov_amount"], user_price_dec());
		$service = $this->formData['payment_service'];
		$url = payment_link($service, array(
			'company_email' => $this->company['email'],
			'amount' => $amt,
			'currency' => $this->formData['curr_code'],
			'comment' => $this->title . " " . $this->formData['reference']
			));
		$Footer[_("You can pay through"). " $service: "] = "$url";
	}

	if ($this->formData['doctype'] == ST_CUSTPAYMENT)
 		$Footer[] = _("* Subject to Realisation of the Cheque.");

	if ($this->params['comments'] != '')
		$Footer[] = $this->params['comments'];

	if (($this->formData['doctype'] == ST_SALESINVOICE || $this->formData['doctype'] == ST_STATEMENT) && $this->company['legal_text'] != "") 
	{
		foreach(explode("\n", $this->company['legal_text']) as $line)
			$Footer[] = $line;
	}

	$this->formData['recipient_name'] = $Addr1['name'];
?>
