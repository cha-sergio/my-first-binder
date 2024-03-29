DROP TABLE IF EXISTS  #temptable1
GO
create table #temptable1
(
    MRN varchar(255),
    ColDateTime datetime
)


-- #SECUREMRN_START ######################################
    -- commands with MRNs go here, paste from your secured file
-- #SECUREMRN_END #######################################

---
--test
--test2
select distinct
    tt1.MRN,
    -- pat.PAT_ID,
    -- tt1.*,
    -- cast(tt1.coldatetime as Date) "Collection Date",
    -- cast(tt1.coldatetime as Time) "Collection Time",
    pat.PAT_NAME "Patient name",
    -- pat.PAT_LAST_NAME,
    -- pat.PAT_FIRST_NAME,
    -- pat.PAT_MIDDLE_NAME,
    ZC_SEX.NAME "Gender",
    cast(pat.BIRTH_DATE as Date) "Date of birth"
from #temptable1 tt1
LEFT JOIN identity_id ii
    ON ii.identity_id = tt1.MRN
    AND ii.identity_type_id = 14
LEFT JOIN patient pat
    ON pat.pat_id = ii.pat_id
    LEFT JOIN ZC_SEX
       ON pat.sex_c = ZC_SEX.INTERNAL_ID
order by MRN desc--test
--test
