:param {
  // Define the file path root and the individual file names required for loading.
  // https://neo4j.com/docs/operations-manual/current/configuration/file-locations/
  file_path_root: 'file:///', // Change this to the folder your script can access the files at.
  file_0: 'dimensions.csv',
  file_1: 'types.csv',
  file_2: 'criteria.csv',
  file_3: 'publishers.csv',
  file_4: 'docs.csv',
  file_5: 'doc-evaluation.csv',
  file_6: 'enablers-barriers.csv'
};

// CONSTRAINT creation
// -------------------
//
// Create node uniqueness constraints, ensuring no duplicates for the given node label and ID property exist in the database. This also ensures no duplicates are introduced in future.
//
// NOTE: The following constraint creation syntax is generated based on the current connected database version 5.19-aura.
CREATE CONSTRAINT `dimensionID_Dimension_uniq` IF NOT EXISTS
FOR (n: `Dimension`)
REQUIRE (n.`dimensionID`) IS UNIQUE;
CREATE CONSTRAINT `criterionID_Criteria_uniq` IF NOT EXISTS
FOR (n: `Criteria`)
REQUIRE (n.`criterionID`) IS UNIQUE;
CREATE CONSTRAINT `docID_Document_uniq` IF NOT EXISTS
FOR (n: `Document`)
REQUIRE (n.`docID`) IS UNIQUE;
CREATE CONSTRAINT `publisherID_Publisher_uniq` IF NOT EXISTS
FOR (n: `Publisher`)
REQUIRE (n.`publisherID`) IS UNIQUE;
CREATE CONSTRAINT `typeID_Type_uniq` IF NOT EXISTS
FOR (n: `Type`)
REQUIRE (n.`typeID`) IS UNIQUE;


// INDEX creation
// -------------------
//
// Create node indexes
//
CREATE INDEX `Dimension_Dimension` IF NOT EXISTS
FOR (n: `Dimension`)
ON (n.`Dimension`);
CREATE INDEX `Criteria_Criteria` IF NOT EXISTS
FOR (n: `Criteria`)
ON (n.`Criteria`);
CREATE INDEX `Name_Document` IF NOT EXISTS
FOR (n: `Document`)
ON (n.`Name`);
CREATE INDEX `Year_Document` IF NOT EXISTS
FOR (n: `Document`)
ON (n.`Year`);
CREATE INDEX `Publisher_Publisher` IF NOT EXISTS
FOR (n: `Publisher`)
ON (n.`Publisher`);
CREATE INDEX `Type_Type` IF NOT EXISTS
FOR (n: `Type`)
ON (n.`Type`);

:param {
  idsToSkip: []
};

// NODE load
// ---------
//
// Load nodes in batches, one node label at a time. Nodes will be created using a MERGE statement to ensure a node with the same label and ID property remains unique. Pre-existing nodes found by a MERGE statement will have their other properties set to the latest values encountered in a load file.
//
// NOTE: Any nodes with IDs in the 'idsToSkip' list parameter will not be loaded.
LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`dimensionID` IN $idsToSkip AND NOT row.`dimensionID` IS NULL
CALL {
  WITH row
  MERGE (n: `Dimension` { `dimensionID`: row.`dimensionID` })
  SET n.`dimensionID` = row.`dimensionID`
  SET n.`Dimension` = row.`dimensionDescription`
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_2) AS row
WITH row
WHERE NOT row.`criterionID` IN $idsToSkip AND NOT row.`criterionID` IS NULL
CALL {
  WITH row
  MERGE (n: `Criteria` { `criterionID`: row.`criterionID` })
  SET n.`criterionID` = row.`criterionID`
  SET n.`Criteria` = row.`criterionName`
  SET n.`Description` = row.`criterionDescription`
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_4) AS row
WITH row
WHERE NOT row.`docID` IN $idsToSkip AND NOT toInteger(trim(row.`docID`)) IS NULL
CALL {
  WITH row
  MERGE (n: `Document` { `docID`: toInteger(trim(row.`docID`)) })
  SET n.`docID` = toInteger(trim(row.`docID`))
  SET n.`Reference` = row.`Reference`
  SET n.`Name` = row.`Name`
  SET n.`Link` = row.`Link`
  SET n.`Year` = toInteger(trim(row.`Year`))
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_3) AS row
WITH row
WHERE NOT row.`publisherID` IN $idsToSkip AND NOT toInteger(trim(row.`publisherID`)) IS NULL
CALL {
  WITH row
  MERGE (n: `Publisher` { `publisherID`: toInteger(trim(row.`publisherID`)) })
  SET n.`publisherID` = toInteger(trim(row.`publisherID`))
  SET n.`Publisher` = row.`publisherName`
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_1) AS row
WITH row
WHERE NOT row.`typeID` IN $idsToSkip AND NOT toInteger(trim(row.`typeID`)) IS NULL
CALL {
  WITH row
  MERGE (n: `Type` { `typeID`: toInteger(trim(row.`typeID`)) })
  SET n.`typeID` = toInteger(trim(row.`typeID`))
  SET n.`Type` = row.`type`
} IN TRANSACTIONS OF 10000 ROWS;


// RELATIONSHIP load
// -----------------
//
// Load relationships in batches, one relationship type at a time. Relationships are created using a MERGE statement, meaning only one relationship of a given type will ever be created between a pair of nodes.
LOAD CSV WITH HEADERS FROM ($file_path_root + $file_2) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `Criteria` { `criterionID`: row.`criterionID` })
  MATCH (target: `Dimension` { `dimensionID`: row.`dimensionID` })
  MERGE (source)-[r: `PART_OF`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_6) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `Criteria` { `criterionID`: row.`enablerID` })
  MATCH (target: `Criteria` { `criterionID`: row.`barrierID` })
  MERGE (source)-[r: `OVERCOME`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_5) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `Document` { `docID`: toInteger(trim(row.`docID`)) })
  MATCH (target: `Criteria` { `criterionID`: row.`criterionID` })
  MERGE (source)-[r: `CONSIDERS`]->(target)
  SET r.`docID` = toInteger(trim(row.`docID`))
  SET r.`criterionID` = row.`criterionID`
  SET r.`Score` = toInteger(trim(row.`score`))
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_4) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `Publisher` { `publisherID`: toInteger(trim(row.`publisherID`)) })
  MATCH (target: `Document` { `docID`: toInteger(trim(row.`docID`)) })
  MERGE (source)-[r: `PUBLISHES`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_4) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `Document` { `docID`: toInteger(trim(row.`docID`)) })
  MATCH (target: `Type` { `typeID`: toInteger(trim(row.`typeID`)) })
  MERGE (source)-[r: `EXAMPLE_OF`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;
