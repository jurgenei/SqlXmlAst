
ALTER TABLE V_AGREEMENT_DSA MODIFY PARTITION BY LIST (DSA_SOURCE) AUTOMATIC
(
  PARTITION part_dsa1 VALUES ('VORTEX_DSA1_OWNER')
, PARTITION part_dsa2 VALUES ('VORTEX_DSA2_OWNER')
, PARTITION part_dsa3 VALUES ('VORTEX_DSA3_OWNER')
, PARTITION part_dsa4 VALUES ('VORTEX_DSA4_OWNER')
, PARTITION part_dsa5 VALUES ('VORTEX_DSA5_OWNER')
)
UPDATE INDEXES ONLINE;
