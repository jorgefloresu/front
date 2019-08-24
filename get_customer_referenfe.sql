SELECT fl_refs.reference
FROM fl_debtor_trans_details,  fl_refs
where fl_debtor_trans_details.debtor_trans_no = fl_refs.id
and fl_debtor_trans_details.debtor_trans_type = fl_refs.type
and debtor_trans_type=10 and fl_debtor_trans_details.stock_id='Fotolia/1año/25/1usu';