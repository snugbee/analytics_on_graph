// How many coworkers have had more than one job?
MATCH p = (c:Coworker)-[:HAS_JOB]->(:Job)-[:PREVIOUS_JOB*]->(:Job)
WHERE length(p) > 1
RETURN count(p) AS empl_changed_jobs

// How many times have coworkers changed jobs?
MATCH p = (c:Coworker)-[:HAS_JOB]->(:Job)-[:PREVIOUS_JOB*]->(:Job)
WHERE length(p) > 1
RETURN count(p) AS n_employees, length(p) - 1 AS job_changes
ORDER BY job_changes DESC

// What is the role that most coworkers move from?
MATCH p = (:Job)<-[:PREVIOUS_JOB]-(j:Job)
WITH j.name AS job, count(j) AS transitions
ORDER BY transitions DESC
RETURN job, transitions

// Who gets promoted to manager the most?
MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})-[:HAS_JOB|PREVIOUS_JOB*1..3]-(c:Coworker)
RETURN c.age_group, count(c.age_group) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})-[:HAS_JOB|PREVIOUS_JOB*1..3]-(c:Coworker)
RETURN c.service_year_group, count(c.service_year_group) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})-[:HAS_JOB|PREVIOUS_JOB*1..3]-(c:Coworker)
RETURN c.nationality, count(c.nationality) AS promoted_to_managers
ORDER BY promoted_to_managers DESC;

MATCH (:Job{is_manager:false})<-[:PREVIOUS_JOB]-(:Job{is_manager:true})-[:HAS_JOB|PREVIOUS_JOB*1..3]-(c:Coworker)-[:WORKS_IN]->(d:Department)
RETURN d.name AS department, count(d) AS promoted_to_managers

// Who gets demoted from manager the most?
MATCH p = (:Job{is_manager:true})<-[:PREVIOUS_JOB]-(:Job{is_manager:false})-[:HAS_JOB|PREVIOUS_JOB*1..3]-(c:Coworker)
RETURN c.age_group, count(c.age_group) AS promoted_to_managers
ORDER BY promoted_to_managers DESC
