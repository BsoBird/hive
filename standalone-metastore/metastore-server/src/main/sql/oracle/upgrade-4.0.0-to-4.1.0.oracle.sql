SELECT 'Upgrading MetaStore schema from 4.0.0 to 4.1.0' AS Status from dual;

-- HIVE-27725
DROP INDEX TAB_COL_STATS_IDX;
CREATE INDEX TAB_COL_STATS_IDX ON TAB_COL_STATS (TBL_ID, COLUMN_NAME);
DROP INDEX TAB_COL_STATS_N49;
ALTER TABLE TAB_COL_STATS DROP (CAT_NAME, DB_NAME, TABLE_NAME);

DROP INDEX PCS_STATS_IDX;
CREATE INDEX PCS_STATS_IDX ON PART_COL_STATS (PART_ID, COLUMN_NAME);
DROP INDEX PART_COL_STATS_N49;
ALTER TABLE PART_COL_STATS DROP (CAT_NAME, DB_NAME, TABLE_NAME, PARTITION_NAME);

-- HIVE-28292
DROP INDEX UNIQUETABLE;
CREATE UNIQUE INDEX UNIQUETABLE ON TBLS (DB_ID, TBL_NAME);
DROP INDEX TBLS_N49;

-- These lines need to be last.  Insert any changes above.
UPDATE VERSION SET SCHEMA_VERSION='4.1.0', VERSION_COMMENT='Hive release version 4.1.0' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 4.0.0 to 4.1.0' AS Status from dual;
