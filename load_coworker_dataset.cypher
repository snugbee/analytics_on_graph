// Create NODE KEY constraints to prevent duplicates 
CREATE CONSTRAINT coworkers IF NOT EXISTS FOR (n:Coworker) REQUIRE (n.employee_id) IS NODE KEY; 
CREATE CONSTRAINT jobs IF NOT EXISTS FOR (n:Job) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT departments IF NOT EXISTS FOR (n:Department) REQUIRE (n.name) IS NODE KEY;
CREATE CONSTRAINT employee_groups IF NOT EXISTS FOR (n:EmployeeGroup) REQUIRE (n.name) IS NODE KEY;

// Load coworker nodes
LOAD CSV WITH HEADERS FROM 'file:///csv/coworkers.csv' AS rows
MERGE (n:Coworker{employee_id: rows.employee_id})
    SET n += rows,
    n.age = toInteger(rows.age),
    n.service_year = toInteger(rows.service_year);

// Load jobs and create HAS_JOB relationships
LOAD CSV WITH HEADERS FROM 'file:///csv/jobs.csv' AS rows
MATCH (n:Coworker{employee_id:rows.employee_id})
MERGE (m:Job{
    name:rows.job,
    is_manager:rows.is_manager})
MERGE (n)-[r:HAS_JOB{start_date:datetime(rows.start_date), end_date:datetime(rows.end_date)}]->(m);

// Load departments and create WORKS_IN relationships
LOAD CSV WITH HEADERS FROM 'file:///csv/departments.csv' AS rows
MATCH (n:Coworker{employee_id:rows.employee_id})
MERGE (d:Department{name:rows.department})
MERGE (n)-[r:WORKS_IN{start_date:datetime(rows.start_date), end_date:datetime(rows.end_date)}]->(d);

// Load employee groups and create IS_MEMBER_OF relationships
LOAD CSV WITH HEADERS FROM 'file:///csv/groups.csv' AS rows
MATCH (n:Coworker{employee_id:rows.employee_id})
MERGE (g:EmployeeGroup{name:rows.employee_group})
MERGE (n)-[r:IS_MEMBER_OF{start_date:datetime(rows.start_date), end_date:datetime(rows.end_date)}]->(g);