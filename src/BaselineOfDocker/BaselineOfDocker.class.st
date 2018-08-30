"
A baseline for https://github.com/astares/Pharo-Docker
"
Class {
	#name : #BaselineOfDocker,
	#superclass : #BaselineOf,
	#category : #BaselineOfDocker
}

{ #category : #baselines }
BaselineOfDocker >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'Docker-Core';
			package: #'Docker-Tools' with: [
				spec requires: #(#'Docker-Core' ). ];			 
			package: #'Docker-Core-Tests' with: [
				spec requires: #(#'Docker-Core' ). ].
		spec 
			group: 'Core' with: #(#'Docker-Core' );
			group: 'Tools' with: #(#'Docker-Tools'  );
			group: 'Tests' with: #(#'Docker-Core-Tests' );
			group: 'all' with: #('Core' 'Tools' 'Tests' );
			group: 'default' with: #('all' ). ].

]
