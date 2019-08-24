SELECT fl_stock_master.category_id,
			fl_stock_category.description AS cat_description,
			fl_stock_master.stock_id,
			fl_stock_master.description, 
			fl_supp_invoice_items.supp_trans_no,
			fl_suppliers.supplier_id,
			fl_suppliers.supp_name AS supplier_name,
			fl_supp_trans.tran_date,
			fl_supp_invoice_items.quantity AS qty,
			(ABS(fl_supp_trans.alloc)) AS Monto,
			(ABS(fl_supp_trans.ov_discount)) AS Descuento,
			(ABS(fl_supp_trans.alloc) - ABS(fl_supp_trans.ov_discount)) AS Comision
		FROM fl_stock_master,
			fl_stock_category,
			fl_suppliers,
			fl_supp_invoice_items,
			fl_supp_trans
		WHERE fl_supp_trans.supplier_id=fl_suppliers.supplier_id
		AND fl_supp_trans.trans_no=fl_supp_invoice_items.supp_trans_no
		AND fl_supp_invoice_items.stock_id=fl_stock_master.stock_id
		AND fl_stock_master.category_id=fl_stock_category.category_id
		AND fl_supp_trans.type=20
		AND fl_supp_trans.tran_date>='2014-06-01'
		AND fl_supp_trans.tran_date<='2014-08-18'
		AND fl_stock_master.mb_flag='B'
		AND fl_suppliers.supplier_id >= '1'
		ORDER BY fl_stock_master.category_id,
			fl_suppliers.supp_name, fl_stock_master.stock_id, fl_supp_trans.tran_date