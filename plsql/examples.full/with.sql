
update dmr_mis_raroc_office tt
set    higher_level_key = office_key
where  rowid in (
    with x as ( 
         SELECT MRO.ROWID ROW_ID
         ,      mro2.office_key 
         FROM   dmr_mis_raroc_office MRO
         ,      dmr_mis_raroc_office MRO2 
         WHERE  mro.higher_level_code = mro2.office_code
         AND    mro.record_valid_until is not null
         AND    mro.higher_level_key is null
    ) 
    select distinct row_id from x
); 