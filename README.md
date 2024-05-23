# SME-AI-Toolkit
Recent advances in artificial intelligence have reignited interest in how it can enable the digital transformation of organizations. Considering the slow pace at which SMEs adopt AI, a wealth of support documents in the form of guidelines, frameworks, and toolkits have been created to aid AI uptake. However, past research shows that no single support document considers all aspects to be relevant to SMEs.

**This practical toolkit was created to help SMEs identify the support documents most applicable for AI adoption in their organization.**

The toolkit is comprised of:
1.	A graph database  containing information on selected, evaluated AI adoption support documents;
2.	A corresponding knowledge graph;
3.	Sample queries according to toolkit use scenarios;
4.	A method for updating the toolkit.

To start searching make sure you have a running Neo4j instance: https://neo4j.com/

![Neo4j_Overview](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/50ae92da-11e5-409b-ac28-0593d0d262c1)

## Setting Up a Neo4j Instance
Easiest way to get started is setting up a free, fully managed _AuraDB_ instance. Start your set-up here: https://neo4j.com/cloud/platform/aura-graph-database/?ref=nav-get-started-cta
Make sure to store the connection password generated during the set-up. You'll need it to log in next time. More information on setting up an _AuraDB_ instance: https://neo4j.com/docs/aura/auradb/getting-started/create-database/

Alternatively, if you plan to use the toolkit frequently or do some advanced searching, you can download the desktop version here: https://neo4j.com/pricing/

Once the instance set-up is done, you can start seacrhing for appropriate AI adoption support. This repository then is divided into:
1.	**Import** - contains the import specification and files with selected, evaluated AI adoption toolkits, guidelines, and frameworks.
2.	**Explore** - views of the knowledge graph that can be retreived using Neo4j _Bloom_.
3.	**Query** - sample search queries for 5 use scenarios based on research on AI adoption in SMEs.

**NB!** Sample queries using _.csv_ files can only be imported to the desktop version of Neo4j.

## Import
1.	Download the file _AI_Knowledge_Graph_Import.zip_ from _Files_
2.	Go to the **Import** section in your Neo4j instance
3.	Click on **...** in the top right corner and select _Open model (with data)_
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/1df72ca7-5425-4dd9-b2de-36d19937a831)
4.	Upload the _.zip_ file you just downloaded
5.	Check the generated import specification and data model. It should look like this:
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/c222e7fe-30ef-4933-8375-343a5875d90f)
  	If correctly mapped and defined, all of the model elements (nodes and edges) should have green tickmarks next to them
6.	Click **Run Import** in the top right corner.
7.	Once run successfully you are ready to explore AI adoption support documents!

## Explore
1.  Go to the **Explore** section in your Neo4j instance
2.  Click **Perspective** icon on the top left corner to select categories you wish to see in your graph
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/919249db-a06d-47a9-b341-a71019b69b2f)
3.  Click on **+ Add category** in the **Perspective** window. A dropdown menu should appear with 5 categories:
    1.  Criteria (criteria according to which support documents were evaluated)
    2.  Dimension (an aggregation of criteria, created as starting points for your search)
    3.  Document (selected and evaluated support documents in the form of AI adoption guidelines, frameworks, toolkits, approaches, methods and more)
    4.  Publisher (publishers of selected documents)
    5.  Type (document types of support documents, e.g. 'toolkit')
4.  Click on each category and it should appear below and in the pane on the right side of the screen
    ![image](https://github.com/rasagu/SME-AI-Toolkit/assets/166431245/9d83c32d-c30f-4ab0-b012-d4994ccc0b49)


