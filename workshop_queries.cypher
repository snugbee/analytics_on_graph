// What does the model look like?
CALL apoc.meta.subGraph({
  includeLabels: ["Coworker","Department","Job","EmployeeGroup", "DeptList", "EmpGrpList", "JobList"],
  includeRels: ["IS_MEMBER_OF","WORKS_IN","HAS_JOB", "IN_LIST","PREVIOUS_JOB","PREVIOUS_DEPARTMENT","PREVIOUS_EMPLOYEE_GROUP"]
});

// How many coworkers have had more than one job?
MATCH (c:Coworker)-[:HAS_JOB]->(:Job)-[:PREVIOUS_JOB]->(:Job)
RETURN count(distinct c) AS empl_changed_job;

// How many times have coworkers changed jobs?
MATCH p = (c:Coworker)-[:HAS_JOB]->(:Job)-[:PREVIOUS_JOB*0..5]->(:Job)
RETURN count(distinct c) AS n_employees, length(p) - 1 AS job_changes
ORDER BY job_changes DESC;

// What is the role that most coworkers move from?
MATCH p = (j:Job)<-[:PREVIOUS_JOB]-(:Job)
WITH j.name AS job, count(j) AS transitions
ORDER BY transitions DESC
RETURN job, transitions;

// What are the most common job transitions?
MATCH (from:Job)<-[:PREVIOUS_JOB]-(to:Job)
RETURN from.name AS fromJob, to.name AS toJob, count(*) AS transitions
ORDER BY transitions DESC
LIMIT 10;

// Who gets promoted to manager the most?
MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})<-[:HAS_JOB|PREVIOUS_JOB*1..5]-(c:Coworker)
RETURN c.age_group, count(c.age_group) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})<-[:HAS_JOB|PREVIOUS_JOB*1..5]-(c:Coworker)
RETURN c.service_year_group, count(c.service_year_group) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})<-[:HAS_JOB|PREVIOUS_JOB*1..5]-(c:Coworker)
RETURN c.nationality, count(c.nationality) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

MATCH (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})<-[:HAS_JOB|PREVIOUS_JOB*1..5]-(c:Coworker)-[:WORKS_IN]->(d:Department)
RETURN d.name AS department, count(d) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

// Who gets demoted from manager the most?
MATCH p = (:Job{is_manager:true})<-[:PREVIOUS_JOB]-(:Job{is_manager:false})<-[:HAS_JOB|PREVIOUS_JOB*1..3]-(c:Coworker)
RETURN c.age_group, count(c.age_group) AS demoted_managers
ORDER BY demoted_managers DESC;
