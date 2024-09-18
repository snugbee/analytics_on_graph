# Analytics on Graph Database workshop

This instruction will set you up for the Neodash part of the workshop. Neodash is a dashboard application that works with the labeled property graph model and the cypher query language. We will be using a Neo4j hosted Neodash application. Neodash is also available as a standalone application that you can run on your infrastructure.

## Loading Neodash dashboards

1. Neodash uses the Neo4j graph database to store dashboards. To load the dashboards that will be used in the workshop, copy the [`load_neodash_dashboards`](https://raw.githubusercontent.com/snugbee/analytics_on_graph/main/load_neodash_dashboards.cypher) code. Then paste the code into the Neo4j Browser query window and execute it by clicking the play button.

<img width="80%" alt="Load Data" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/loaddashboards.jpeg?raw=true">

## Start Neodash and connect to the Neo4j database

1. Open the Neodash application by clicking on this link [Neodash](https://neodash.graphapp.io/).
2. Choose "Existing Dashboard".

<img width="70%" alt="Connect Neodash to db" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/connectneodash.jpeg?raw=true">
3. Go to the Neo4j Sandbox and (1) click on the expand button. (2) Open the "Connection details" tab. (3) Copy the connection details and the (4) password as described in the picture below:

<img width="90%" alt="Connect Neodash to db" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/connectneodash2.jpeg?raw=true">

3. Switch back to the Neodash tab and paste the connection details into the Neodash connection form and click "Connect".

<img width="70%" alt="Connect Neodash to db" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/connectneodash3.jpeg?raw=true">

And now you're all set for the Neodash part of the workshop!
