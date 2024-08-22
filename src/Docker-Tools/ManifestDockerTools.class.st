"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestDockerTools',
	#superclass : 'PackageManifest',
	#category : 'Docker-Tools-Manifest',
	#package : 'Docker-Tools',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestDockerTools class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#DockerHubSpotterProcessor)) #'2024-08-22T16:20:53.65441+02:00') )
]
