// Create NODE KEY constraints to prevent duplicates 
CREATE CONSTRAINT coworkers IF NOT EXISTS FOR (n:Coworker) REQUIRE (n.employee_id) IS NODE KEY;
CREATE CONSTRAINT jobs IF NOT EXISTS FOR (n:Job) REQUIRE (n.uuid) IS NODE KEY; 
CREATE CONSTRAINT job_list IF NOT EXISTS FOR (n:JobList) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT departments IF NOT EXISTS FOR (n:Department) REQUIRE (n.uuid) IS NODE KEY; 
CREATE CONSTRAINT dept_list IF NOT EXISTS FOR (n:DeptList) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT employee_grps IF NOT EXISTS FOR (n:EmployeeGroup) REQUIRE (n.uuid) IS NODE KEY;
CREATE CONSTRAINT emp_grp_list IF NOT EXISTS FOR (n:EmpGrpList) REQUIRE (n.name) IS NODE KEY;

// Load coworker nodes
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/snugbee/analytics_on_graph/main/csv/coworkers.csv' AS rows
MERGE (n:Coworker{employee_id: rows.employee_id})
    SET n += rows,
    n.age = toInteger(rows.age),
    n.service_year = toInteger(rows.service_year);

// Load jobs and create HAS_JOB relationships
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/snugbee/analytics_on_graph/main/csv/jobs.csv' AS rows
WITH rows,
    CASE rows.is_manager 
        WHEN 'Non Manager' THEN false
        WHEN 'Manager' THEN true
        ELSE null
    END as manager
MATCH (n:Coworker{employee_id:rows.employee_id})
MERGE (m:JobList{
    name:rows.job,
    is_manager:manager})
MERGE (n)-[:HAS_JOB]->(:Job{name:rows.job,start_date:date(rows.start_date), end_date:date(left(rows.end_date, 10)), is_manager:manager,uuid:apoc.create.uuid()})-[:IN_LIST]->(m);

// Create linked list of jobs
MATCH (c:Coworker)-[:HAS_JOB]->(j:Job)
WITH c, j
ORDER BY j.start_date desc
WITH c, collect(j) as jobs
CALL apoc.nodes.link(jobs, 'PREVIOUS_JOB');

// Delete HAS_JOB relationships between Coworkers and previous jobs
MATCH (j:Job)<-[:PREVIOUS_JOB]-(:Job)
MATCH (j)<-[r:HAS_JOB]-(:Coworker)
DELETE r;

// Load departments and create WORKS_IN relationships
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/snugbee/analytics_on_graph/main/csv/departments.csv' AS rows
MATCH (n:Coworker{employee_id:rows.employee_id})
MERGE (d:DeptList{name:rows.department})
MERGE (n)-[r:WORKS_IN]->(:Department{name:rows.department, start_date:date(rows.start_date), end_date:date(left(rows.end_date, 10)), uuid:apoc.create.uuid()})-[:IN_LIST]->(d);

// Create linked list of departments
MATCH (c:Coworker)-[:WORKS_IN]->(d:Department)
WITH c, d
ORDER BY d.start_date desc
WITH c, collect(d) as departments
CALL apoc.nodes.link(departments, 'PREVIOUS_DEPARTMENT');

// Delete WORKS_IN relationships between Coworkers and previous departments
MATCH (d:Department)<-[:PREVIOUS_DEPARTMENT]-(:Department)
MATCH (d)<-[r:WORKS_IN]-(:Coworker)
DELETE r;

// Load employee groups and create relationships
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/snugbee/analytics_on_graph/main/csv/groups.csv' AS rows
MATCH (n:Coworker{employee_id:rows.employee_id})
MERGE (g:EmpGrpList{name:rows.employee_group})
MERGE (n)-[:IS_MEMBER_OF]->(:EmployeeGroup{name:rows.employee_group, start_date:date(rows.start_date), end_date:date(left(rows.end_date, 10)), uuid:apoc.create.uuid()})-[r:IN_LIST]->(g);

// Create linked list of employment types
MATCH (c:Coworker)-[:IS_MEMBER_OF]->(e:EmployeeGroup)
WITH c, e
ORDER BY e.start_date desc
WITH c, collect(e) as employments
CALL apoc.nodes.link(employments, 'PREVIOUS_EMPLOYEE_GROUP');

// Delete EMPLOYMENT_TYPE relationships between Coworkers and previous employment types
MATCH (e:EmpGrpList)<-[:PREVIOUS_EMPLOYEE_GROUP]-(:EmpGrpList)
MATCH (e)<-[r:IS_MEMBER_OF]-(:Coworker)
DELETE r;
