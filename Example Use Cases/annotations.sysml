
package 'Architecture Annotation Views' {
	private import ScalarValues::*;
	private import Views::*; 
	
	package AnnotationDefinitions {	
		metadata def Safety; 
		metadata def Cybersecurity;
		metadata def HumanSystemIntegration;
		
	}
	
	
package 'UmnannedSystem' {
	private import AnnotationDefinitions::*;
	private import RiskMetadata::*;
	private import RiskLevelEnum::*;
	
	
	
	attribute def OnboardComputer;
	attribute def RemoteComputer;
	part def UnmannedSystemArchitecture {
	
		part batteryStorageModule;	
		
		part electricPropulsionSystem; 
		
		part Computer {@HumanSystemIntegration;@Safety; 		
			attribute onboardComputer : OnboardComputer;
			attribute remoteComputer : RemoteComputer; 			
		} 
									
		part satelliteCommunicationSystem{@Cybersecurity;}
		part opticalCamera;
		part digitalTwinProcessingSystem {@Safety;@Cybersecurity;}
	ref Brickford2020;
	}
}
	
package 'Requirements'{
	private import RiskMetadata::*;
	private import RiskLevelEnum::*;
	
	requirement <'A'> services {
			doc /* The unmanned vehicle shall provide littoral patrol services. */
			subject system: UnmannedSystemArchitecture;
			}





