/*

US2000JobType:
MAKE_APPLICATION(0),
IMPORT_GRANT(1),
CREATE_REIMBURSEMENT(2),
IMPORT_CASES(3),
OLD_LEGACY(4),
IMPORT_REIMBURSEMENT(5),
SUPPORT_ITEM_ORDER(6),
RE_FETCH_GRANT(7),
SPSA_APPLICATION(8);

US2000JobState:
CREATED(0,"Oprettet"),
QUEUED(1, "I kø"),
RUNNING(2, "Afvikles"),
COMPLETED(3,"Afsluttet"),
FAILED(4, "Fejlet"),
CANCELLED(5, "Cancelled");

*/

-- Find all jobs and workstatehistory that are of the type create reimbursement
select * from US2000WorkStateHistory
left join  US2000Job on US2000WorkStateHistory.US2000JobId = US2000Job.id
where US2000Job.type = 2
order by US2000WorkStateHistory.id desc

-- Find all reimbursement jobs that are active

select * from US2000WorkStateHistory
left join  US2000Job on US2000WorkStateHistory.US2000JobId = US2000Job.id
where US2000Job.type = 2 and US2000Job.state in (0,1,2)
order by US2000WorkStateHistory.id desc


/*

 select * from US2000WorkStateHistory
left join  US2000Job on US2000WorkStateHistory.US2000JobId = US2000Job.id
where US2000Job.type = 2 and US2000Job.parameters like '%"reimbursementId":41%'
order by US2000WorkStateHistory.id desc-- Find the US2000Job where


 select * from US2000WorkStateHistory
left join  US2000Job on US2000WorkStateHistory.US2000JobId = US2000Job.id
where US2000JobId = 22770
order by US2000WorkStateHistory.id desc
 */
