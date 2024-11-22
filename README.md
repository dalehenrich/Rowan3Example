This project was created using code in the following doit, as an example of the Rowan 3 API:
```
	| rowanProjectsHome projectName definedProject resolvedProject className packageName |
"Create a project"
	rowanProjectsHome := '/home/dhenrich/projects'.
	projectName := 'Rowan3Example'.
	className := 'ExampleClass'.
  definedProject :=  (Rowan newProjectNamed: projectName)
		projectsHome: rowanProjectsHome;
		specName: projectName;
		specComponentNames: { 'Core' };
		addLoadComponentNamed: 'Core';
		addSubcomponentNamed: 'tests/Tests'
			condition: 'tests'
			toComponentNamed: 'Core';
		customConditionalAttributes: {'tests' };
		comment: 'I am an example project';
		packageConvention: 'Rowan';
		yourself.
"Add two packages"
	definedProject
		addPackagesNamed: {(projectName , '-Core')}
			toComponentNamed: 'Core';
		addPackageNamed: projectName , '-Tests'
			toComponentNamed: 'tests/Tests';
		yourself.
"Define a class with a method and add them to a package"
	packageName := projectName , '-Core'.
	className := projectName , 'Class1'.
	((definedProject packageNamed: packageName)
		addClassNamed: className
		super: 'Object'
		instvars: #('ivar1')
		category: packageName
		comment: 'I am an example class')
		addInstanceMethod: 'foo ^1' protocol: 'accessing';
		yourself.
"Define a test class with a test method and add them to a package"
	packageName := projectName , '-Tests'.
	((definedProject packageNamed: packageName)
		addClassNamed: projectName , 'TestCase'
		super: 'TestCase'
		category: packageName
		comment: 'I test the example class')
		addInstanceMethod: 'test  self assert: ' , className , ' new foo = 1'
			protocol: 'tests';
		yourself.
"Export the project definitions to disk including the load spec"
	resolvedProject := definedProject resolveStrict.
	resolvedProject
		export;
		exportLoadSpecification.

"Read the load spec from disk and load the project"
	(RwSpecification fromFile: rowanProjectsHome asFileReference / projectName / 'rowan' / 'specs' / projectName , 'ston')
		projectsHome: rowanProjectsHome;
		load
```
