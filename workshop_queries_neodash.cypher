// Write a query to return the name of the departments and their coworker counts so we can see them as a list.
MATCH (d:Department)-[]-(c:Coworker)
RETURN DISTINCT d.name AS Department, COUNT(c) AS CoworkerCounts
ORDER BY Department;


// Write a query to return the number of coworkers per nationality so we can see the distribution in a bar chart, largest group at the top.
MATCH (n:Coworker)
RETURN n.nationality AS Nationality, COUNT(n) AS Counts
ORDER BY Counts;

// Write a query to return the number of coworkers per age_group so we can see the distribution in a bar chart, largest group at the top.
MATCH (n:Coworker)
RETURN n.age_group AS AgeGroup, COUNT(n) AS Counts
ORDER BY AgeGroup DESC;



// Write a query to return the number of coworkers who changed job, per gender so we can see the distribution in a bar chart.
MATCH p1 = (c:Coworker)-[:HAS_JOB]->(j1:Job)-[:PREVIOUS_JOB*1..5]->(j2:Job)
WHERE LENGTH(p1) > 1
RETURN  DISTINCT c.gender AS Gender, COUNT(c.employee_id) AS NumberOfCoworker
ORDER BY Gender DESC;

// Write a query to return the number of coworkers who changed job, per nationality so we can see the distribution in a bar chart.
MATCH p1 = (c:Coworker)-[:HAS_JOB]->(j1:Job)-[:PREVIOUS_JOB*1..5]->(j2:Job)
WHERE LENGTH(p1) > 1
RETURN  DISTINCT c.nationality AS Nationality, COUNT(c.employee_id) AS NumberOfCoworker
ORDER BY NumberOfCoworker;

// Write a query to return the number of coworkers who changed job, per service_year_group so we can see the distribution in a bar chart.
MATCH p1 = (c:Coworker)-[:HAS_JOB]->(j1:Job)-[:PREVIOUS_JOB*1..5]->(j2:Job)
WHERE LENGTH(p1) > 1
RETURN  DISTINCT c.service_year_group AS ServiceYear, COUNT(c.employee_id) as NumberOfCoworker
ORDER BY ServiceYear DESC;

// Write a query to return the top 3 previous jobs from which coworkers changed the most.
MATCH p = (j:Job)<-[:PREVIOUS_JOB*1..5]-(:Job)
WITH j.name AS job, COUNT(j) AS transitions
ORDER BY transitions DESC
RETURN job, transitions
LIMIT 3;


// Write a query to return the number of coworkers who were promoted to a managerial job, per gender so we can see the distribution in a bar chart.
MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB*1..5]-(:Job{is_manager:true})-[:HAS_JOB]-(c:Coworker)
RETURN c.gender AS Gender, COUNT(c) AS promoted_to_managers
ORDER BY promoted_to_managers;

// Write a query to return the number of coworkers who were promoted to a managerial job, per nationality so we can see the distribution in a bar chart.
MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB*1..5]-(:Job{is_manager:true})-[:HAS_JOB]-(c:Coworker)
RETURN c.nationality, COUNT(c) AS promoted_to_managers
ORDER BY promoted_to_managers;

// Write a query to return the number of coworkers who were promoted to a managerial job, per age_group so we can see the distribution in a bar chart.
MATCH p = (:Job{is_manager:false})<-[:PREVIOUS_JOB*1..5]-(:Job{is_manager:true})-[:HAS_JOB]-(c:Coworker)
RETURN c.age_group, COUNT(c) AS promoted_to_managers
ORDER BY promoted_to_managers;
