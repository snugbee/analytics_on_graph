// Create NODE KEY constraints to prevent duplicates 
CREATE CONSTRAINT coworkers IF NOT EXISTS FOR (n:Coworker) REQUIRE (n.employee_id) IS NODE KEY;
CREATE CONSTRAINT jobs IF NOT EXISTS FOR (n:Job) REQUIRE (n.uuid) IS NODE KEY; 
CREATE CONSTRAINT roles IF NOT EXISTS FOR (n:Role) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT departments IF NOT EXISTS FOR (n:Department) REQUIRE (n.uuid) IS NODE KEY; 
CREATE CONSTRAINT org_departments IF NOT EXISTS FOR (n:OrgDepartment) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT employee_groups IF NOT EXISTS FOR (n:EmployeeGroup) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT employments IF NOT EXISTS FOR (n:Employment) REQUIRE (n.uuid) IS NODE KEY;

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
MERGE (m:Role{
    name:rows.job,
    is_manager:manager})
MERGE (n)-[:HAS_JOB]->(:Job{name:rows.job,start_date:date(rows.start_date), end_date:date(left(rows.end_date, 10)), is_manager:manager,uuid:apoc.create.uuid()})-[:IS_TYPE_OF]->(m);

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
MERGE (d:OrgDepartment{name:rows.department})
MERGE (n)-[r:WORKS_IN]->(:Department{name:rows.department, start_date:date(rows.start_date), end_date:date(left(rows.end_date, 10)), uuid:apoc.create.uuid()})-[:IN_ORG]->(d);

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
MERGE (g:EmployeeGroup{name:rows.employee_group})
MERGE (n)-[:EMPLOYMENT_TYPE]->(:Employment{type:rows.employee_group, start_date:date(rows.start_date), end_date:date(left(rows.end_date, 10)), uuid:apoc.create.uuid()})-[r:IS_MEMBER_OF]->(g);

// Create linked list of employment types
MATCH (c:Coworker)-[:EMPLOYMENT_TYPE]->(e:Employment)
WITH c, e
ORDER BY e.start_date desc
WITH c, collect(e) as employments
CALL apoc.nodes.link(employments, 'PREVIOUS_EMPLOYMENT_TYPE');

// Delete EMPLOYMENT_TYPE relationships between Coworkers and previous employment types
MATCH (e:Employment)<-[:PREVIOUS_EMPLOYMENT_TYPE]-(:Employment)
MATCH (e)<-[r:EMPLOYMENT_TYPE]-(:Coworker)
DELETE r;
