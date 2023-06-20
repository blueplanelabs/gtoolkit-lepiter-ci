Transcript show: 'Loading GtoolkitCiExperiment project...'; cr.

Metacello new
	repository: 'github://blueplanelabs/gtoolkit-ci-experiment:main/src';
	baseline: 'GtoolkitCiExperiment';
	load.

Transcript show: 'Loading knowledge database...'; cr.

BaselineOfGtoolkitCiExperiment loadKnowledge.

Transcript show: 'Applying knowledge snippets...'; cr.

testPage := (LeDatabasesRegistry defaultLogicalDatabase databaseNamed: 'gtoolkit-ci-experiment/lepiter') pages first.

Transcript show: 'Found Test Page'; cr.

snippets := testPage allChildrenSnippetsMatching: [ :aSnippet |
    aSnippet isKindOf: LePharoSnippet].

Transcript show: 'Found ', (snippets size) asString , ' Pharo snippets to be applied.'; cr.

snippets do: [ :aSnippet |
    aSnippet coder doItAll ].

Transcript show: 'Exists LepiterDefinedClass? ', (Smalltalk at: #LepiterDefinedClass) isNotNil asString; cr.