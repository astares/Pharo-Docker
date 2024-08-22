"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestDockerCore',
	#superclass : 'PackageManifest',
	#category : 'Docker-Core-Manifest',
	#package : 'Docker-Core',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestDockerCore class >> ruleExcessiveArgumentsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'DockerContainer class' #id:image:command:created:status:ports:names: #true)) #'2024-08-22T20:39:50.721384+02:00') )
]
