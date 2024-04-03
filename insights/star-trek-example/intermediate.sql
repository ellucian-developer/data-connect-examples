select
   distinct study.person_uid,
   study.program,
   study.program_desc,
   spriden.spriden_first_name,
   spriden.spriden_last_name
from
   academic_study study,
   spriden spriden
where
   spriden.spriden_pidm = person_uid AND
   study.program = 'BS_COMPSCI'