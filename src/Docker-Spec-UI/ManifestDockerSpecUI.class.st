"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestDockerSpecUI',
	#superclass : 'PackageManifest',
	#category : 'Docker-Spec-UI-Manifest',
	#package : 'Docker-Spec-UI',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestDockerSpecUI class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'DockerIconProvider class' #iconNamed:ifAbsent: #true)) #'2024-08-26T19:47:56.768683+02:00') )
]
