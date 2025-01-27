package UmnannedSystem {
	part def UnmannedSystemArchitecture {
	
		part batteryStorageModule;	
		part electricPropulsionSystem; 
		part onboardComputer;
		part satelliteCommunicationSystem;
		part opticalCamera;
		part digitalTwinProcessingSystem;
	ref Brickford2020;
	}


package 'Requirements'{
	
	requirement <'A'> services {
			doc /* The unmanned vehicle shall provide littoral patrol services. */
			subject system: UnmannedSystemArchitecture;
			}
	requirement <'B'> gps {
			doc /* The unmanned vehicle shall run missions based on GPS waypoints. */
			subject satelliteCommunicationSystem;
			}
	requirement <'C'> operator {
			doc /* The control operator shall monitor GPS position from a remote location . */
			subject onboardComputer;
			}
		}
			
	
library package 'IlityEnumerationsMetadata' {
// Enumeration definition for the Timing Threshold Type of Measurement associated to the requirement
	enum def TimingThresholdType { within; before; exactlyAt; noLaterThan; every; afterConstraint; }
	
// Enumeration definition for the Value Threshold Type of Measurement associated to the requirement
	enum def ValueThresholdType { within; exactlyWith; notExceed; notLessThan; notGreaterThan; }
	//Enumeration definition for the Ility Type associated to the requirement
	enum def IlityType {Safety; HumanSystemIntegration; Cybersecurity;
	} 
	}
	
	
library package LossDrivenEngineeringLibrary {
	private import ScalarValues::*;
	private import Metaobjects::SemanticMetadata;

	//Adversity
	connection def Adversity {
   			end satelliteCommunicationSystem;
			end gpsPosition;
  		}
		abstract connection adversities : Adversity[*] nonunique;
		metadata def <adversity> AdversityMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = adversities meta SysML::Usage;
		}
	
		
	//Coping Mechanism
	 connection def CopingStrategy {
			end activateTheAbortFunction;
			end gpsPosition;
  			}
  			
		abstract connection copingStrategies : CopingStrategy[*] nonunique;
		metadata def <copingStrategy> CopingStrategyMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = copingStrategies meta SysML::Usage;
			}
			}				
			

//Category 3: // Functional Containment Requirement		   
library package gpsPosition {					
	private import Metaobjects::SemanticMetadata;
	private import ModelingMetadata::*;
	private import ISQ::*;
	private import ScalarValues::*;
	private import CauseAndEffect::*;
	private import IlityEnumerationsMetadata::*;
	private import LossDrivenEngineeringLibrary::*;
	private import Time::*;
	private import RequirementDerivation::*;
				
   requirement <'1'> gpsPosition {
   	private import RequirementDerivation::*;
		doc/* If it is detected that the GPS position is lost, 
			 * then activate the abort function to transition the system to a
			 * safe state within 5 seconds.
		 */ 
		
		enum ility = IlityType::Safety;
		 #derivation connection def abort_Derivation {
			end #original gps;
			end #derive gpsPosition;
			}
      subject satelliteCommunicationSystem;
     	 event occurrence satelliteCommunicationSystemFails;
     	 #adversity connect gpsPosition to satelliteCommunicationSystemFails;
     	 
     	 event occurrence activateTheAbortFunction{
			attribute timing = TimingThresholdType::exactlyAt;
			constraint timeLimit: TimeLimit {limit=5 [s]}
				 
			#copingStrategy connect gpsPosition to activateTheAbortFunction;
     	 	}
     	 
     	 }
     	 
     	 }
     	 
     	 
     	 
     	 
     	 
     	 
     	 
 