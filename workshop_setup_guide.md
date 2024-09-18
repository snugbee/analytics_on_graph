# Analytics on Graph Database workshop

This instruction will set you up for the workshop. We will be using a sandbox environment hosting Neo4j databases. The sandbox environment is a free, cloud-based Neo4j instance that you can use for learning and experimentation.

## Setting up the Sandbox environment

1. Open one of the following supported web browsers (other browsers will likely work):

    * Google Chrome (Latest stable version)
    * Mozilla Firefox (Latest stable version)
    * Microsoft Edge (Latest stable version)

2. Browse to <https://sandbox.neo4j.com>
3. If this is the first time you're using Neo4j Sandbox you'll have to either:
    * (Preferred option) Log on using an existing Google, X or LinkedIn account, or
    * Sign up for an account with Neo4j

4. Once you're signed in you'll be asked to agree to Neo4j's terms and answer a few questions. If you signed up for an account with Neo4j you'll have to verify your email address. Once that is done you're able to choose what kind of sandbox to create. Choose the "Blank Sandbox" alternative:

<img width="60%" alt="Blank Sandbox" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/blanksandbox.jpeg?raw=true">

5. The sandbox will be created, a credentials file will be downloaded and you'll be taken to the sandbox page. Click the "Open" button to open the Neo4j Browser: 

<img width="80%" alt="Open Browser" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/openbrowser.jpeg?raw=true">

6. Connect to the database using the "Single Sign On" authentication method. Sometimes this leads to another log on dialog. In that case use the same account as when you logged in to Neo4j Sandbox in the second step of this guide.

<img width="60%" alt="Connect to Database" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/connectdb.jpeg?raw=true">

7. There is no data in the database yet. To load data into the database, copy the [`load_coworker_dataset`](https://raw.githubusercontent.com/snugbee/analytics_on_graph/main/load_coworker_dataset.cypher) code. Then paste the code into the Neo4j Browser query window and press the play button to execute.

<img width="80%" alt="Load Data" src="https://github.com/snugbee/analytics_on_graph/blob/main/img/querywindow.jpeg?raw=true">

And now you're all set for the workshop!
