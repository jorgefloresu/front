SELECT fl_stock_master.category_id,
			fl_stock_category.description AS cat_description,
			fl_stock_master.stock_id,
			fl_stock_master.description, fl_stock_master.inactive,
			fl_stock_moves.loc_code,
			fl_suppliers.supplier_id,
			fl_suppliers.supp_name AS supplier_name,
			fl_stock_moves.tran_date,
			fl_stock_moves.qty AS qty,
			fl_stock_moves.price*(1-fl_stock_moves.discount_percent) AS price,
			fl_stock_moves.price*fl_suppliers.supp_account_no AS comision
		FROM fl_stock_master,
			fl_stock_category,
			fl_suppliers,
			fl_stock_moves
		WHERE fl_stock_master.stock_id=fl_stock_moves.stock_id
		AND fl_stock_master.category_id=fl_stock_category.category_id
		AND fl_stock_moves.person_id=fl_suppliers.supplier_id
		AND fl_stock_moves.tran_date>='2014-06-01'
		AND fl_stock_moves.tran_date<='2014-08-18'
		AND fl_stock_moves.type=25
		AND (fl_stock_master.mb_flag='B' OR fl_stock_master.mb_flag='M')
		ORDER BY fl_stock_master.category_id,
			fl_suppliers.supp_name, fl_stock_master.stock_id, fl_stock_moves.tran_date