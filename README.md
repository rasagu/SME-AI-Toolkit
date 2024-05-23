# SME-AI-Toolkit
Recent advances in artificial intelligence have reignited interest in how it can enable the digital transformation of organizations. Considering the slow pace at which SMEs adopt AI, a wealth of support documents in the form of guidelines, frameworks, and toolkits have been created to aid AI uptake. However, past research shows that no single support document considers all aspects to be relevant to SMEs.

**This practical toolkit was created to help SMEs identify the support documents most applicable for AI adoption in their organization.**

The toolkit is comprised of:
1.	A graph database  containing information on selected, evaluated AI adoption support documents;
2.	A corresponding knowledge graph;
3.	Sample queries according to toolkit use scenarios;
4.	A method for updating the toolkit.

To start searching, make sure you have a running Neo4j instance: https://neo4j.com/

![Neo4j_Overview](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/50ae92da-11e5-409b-ac28-0593d0d262c1)

## Setting Up a Neo4j Instance
Easiest way to get started is setting up a free, fully managed _AuraDB_ instance. Start your set-up here: https://neo4j.com/cloud/platform/aura-graph-database/?ref=nav-get-started-cta
Make sure to store the connection password generated during the set-up. You'll need it to log in next time.
More information on setting up an _AuraDB_ instance: https://neo4j.com/docs/aura/auradb/getting-started/create-database/

Alternatively, if you plan to use the toolkit frequently or do some advanced searching, you can download the desktop version here: https://neo4j.com/pricing/

Once the instance set-up is done, you can start seacrhing for appropriate AI adoption support. This repository then is divided into:
1.	**Import** - contains the import specification and files with selected, evaluated AI adoption toolkits, guidelines, and frameworks.
2.	**Explore** - views of the knowledge graph that can be retreived using Neo4j _Bloom_.
3.	**Query** - sample search queries for 5 use scenarios based on research on AI adoption in SMEs.

**NB!** Sample queries using _.csv_ files can only be imported to the desktop version of Neo4j.

## Import
1.	Download the file _AI_Knowledge_Graph_Import.zip_ from _Import_
2.	Go to the **Import** section in your Neo4j instance
3.	Click on **...** in the top right corner and select _Open model (with data)_

  	![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/1df72ca7-5425-4dd9-b2de-36d19937a831)
  	
5.	Upload the _.zip_ file you just downloaded
6.	Check the generated import specification and data model. It should look like this:
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/c222e7fe-30ef-4933-8375-343a5875d90f)

  	If correctly mapped and defined, all of the model elements (nodes and edges) should have green tickmarks next to them
7.	Click **Run Import** in the top right corner.
8.	Once run successfully you are ready to explore AI adoption support documents!

## Explore
1.  Go to the **Explore** section in your Neo4j instance
2.  Click **Perspective** icon on the top left corner to select categories you wish to see in your graph
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/919249db-a06d-47a9-b341-a71019b69b2f)
3.  Click on **+ Add category** in the **Perspective** pane. A dropdown menu should appear with 5 categories:
    1.  Criteria (criteria according to which support documents were evaluated)
    2.  Dimension (an aggregation of criteria, created as starting points for your search)
    3.  Document (selected and evaluated support documents in the form of AI adoption guidelines, frameworks, toolkits, approaches, methods and more)
    4.  Publisher (publishers of selected documents)
    5.  Type (document types of support documents, e.g. 'toolkit')
4.  Click on each category and it should appear below in the **Perspective** and in the pane on the right side of the screen
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/9d83c32d-c30f-4ab0-b012-d4994ccc0b49)

You are ready to start exploring! Select categories, specific nodes or relationships which you'd like to see in the search bar on the top left corner of the screen
![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/2efcf473-1133-4062-958b-1bd77501d32e)

Click enter or the _Play_ button in the search bar and the corresponding nodes and relationships will appear on the workspace. Right click on a node or relationship and you will be able to:
    1.  **Inspect** - see additional information about the node (e.g. support document links, year of publishing)
    2.  **Expand** - reveal connections to other nodes
 
### Example of Explore
_To see which support document provide guidance on overcoming limited employee capabilities follow these steps:_
1.  In the search bar select **Dimension value (equals): AI barriers** --*(any)*-- **Criteria**
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/c5053c4b-5b64-4fa0-a04e-071c053ccd9a)

2.  The nodes will appear on the workspace. The graph should look like this:
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/7f7136e3-3160-4cbe-b0cb-133aec1e6099)

3.  Locate _Lack of employee capabilities_, right click. In the dropdown menu select **Expand**. Either expand a specific type of relationship (e.g. _OVERCOME_) or all relationships that a node has (_All_)
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/af585103-90d0-4de1-b74f-cd3c3bebb7d0)

    In this case, you should see that a _Lack of employee capabilities_ barrier can be overcome by either _Developing dynamic capabilities_, _Innovation culture_ or implementing _Simple solutions_.
4.  To see which support documents cover _Simple solutions_ right click on the node. In the dropdown menu select **Expand**. Select _CONSIDERS_ to see which documents consider this.
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/96288e62-1470-496d-a44f-afa52db7beb2)

5.  To read a specific support document of interest, right click on the document node. In the dropdown menu select **Inspect**. A pop-up window with the document link will appear.
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/7893ff6a-39b9-44bf-a791-de5e94eca063)

## Query
1.  Go to the **Query** section in your Neo4j instance
2.  _If you're working in the desktop version_:
    1.  Download the file _sample-queries.csv_ from _Query_
    2.  Click on the **Saved Cypher** icon (Bookmark) on the left side of the screen
    3.  At the top of the **Save Cypher** pane click on the *Upload* icon (Arrow pointing up)
    4.  Upload the _.csv_ file you just downloaded
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/f9b4eb5a-add3-4712-9cf8-3d913bdd2655)

    _If you're working in the browser version_:
    1.  Copy the _Cypher_ code from _Query_
    2.  Paste in the top bar
    3.  Click the _Play_ button in the top right of the bar
        ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/6cd65591-b676-42dd-aafe-d7e09cfab626)

    4.  Once run successfully, save the query by clicking on the _Bookmark_ icon on the top right corner of the bar
        ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/796ffb68-e3ca-4aec-bb82-cbacd799284b)

There are 5 search scenarios considered: _Getting started_, _Documents by AI adoption stage_, _Documents to overcome barriers_, _Documents by AI use case_, and _Documents by type_. Each scenario represents plausible document search requirements by SMEs.

### Example of Query
_To see which are the highest ranked support documents in the _Getting started_ scenario_
1.  Run the _Highest scores_ query either from **Stored Cypher** pane or by copying _Cypher_ code into the top bar
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/65487c38-690e-42a7-a70f-cc7c44c3e50b)

2.  The nodes will appear on the workspace. The graph should look like this:
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/5b4ea934-6d6d-4c62-9752-bb10d93275c2)

    The query returns the result in a graph, tabular, and JSON code format. For _Highest scores_, the tabular format provides most information.
3.  To inspect a specific support document, click on the document node. Node information will appear in the right pane
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/f4de028e-d413-43a0-b11d-8afa3e3939b8)

4.  To change the view of the results, select a view you prefer on the top left of the workspace
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/21e6cb7e-c445-40b6-8a09-a09ca25cb6a7)
