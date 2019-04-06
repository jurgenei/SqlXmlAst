merge INTO (select record_valid_from,large_asset_indicator,effective_regulated_indicator,source_table,increase_correlation_ind from tmp_corep_recap) t1
USING (SELECT t.ROWID row_id, icl.increase_correlation_ind
FROM increase_correlation_ind icl ,tmp_corep_recap t
WHERE icl.record_valid_from <= t.record_valid_from
 AND ( icl.record_valid_until > t.record_valid_from
 OR icl.record_valid_until IS NULL )
 AND NVL(icl.effective_regulated_indicator, ' ') = NVL(t.effective_regulated_indicator, ' ')
 AND NVL(icl.large_asset_indicator, ' ') = NVL(t.large_asset_indicator, ' ')
 AND t.source_table = 'IRB') src
ON ( t1.ROWID = src.row_id )
WHEN MATCHED THEN UPDATE SET t1.increase_correlation_ind = src.increase_correlation_ind;
