//Group3RequirementMetadata
library package IlityEnumerationsMetadata {
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
   			end FunctionalElement;
			end Group3RequirementMetadata;
  		}
		abstract connection adversities : Adversity[*] nonunique;
		metadata def <adversity> AdversityMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = adversities meta SysML::Usage;
		}
	//Loss
		
	//Coping Mechanism
	 connection def CopingStrategy {
			end ContainFailure;
			end Group3RequirementMetadata;
  			}
  			
		abstract connection copingStrategies : CopingStrategy[*] nonunique;
		metadata def <copingStrategy> CopingStrategyMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = copingStrategies meta SysML::Usage;
			}
			}				
			
//Functional element
	part def FunctionalElement;	
//Category 3: // Functional Containment Requirement		   
library package Group3RequirementMetadata {					
	private import Metaobjects::SemanticMetadata;
	private import ModelingMetadata::*;
	private import ISQBase::*;
	private import ScalarValues::*;
	private import CauseAndEffect::*;
	private import IlityEnumerationsMetadata::*;
	private import LossDrivenEngineeringLibrary::*;
	
  
   // Category 3 requirement modeling
    	   requirement Group3RequirementMetadata {
		doc/* If it is detected that <<functional element>> <<failure associated to the functional element>> 
		 * <<variation of Threshold Type and Constraint Choices>> then
		 * <<Action to contain the failure associated to the functional element>> << variation of Threshold Type and Constraint Choices>>.
		 */ 	 
		 enum ility : IlityType;
      subject functionalElement : FunctionalElement ;
     	 event occurrence functionalElementFails {
       			attribute def Timing {
					attribute timing : TimingThresholdType;
					constraint def TimeLimit {limit:Real;
					}
				}	
				attribute def Value {
					attribute value: ValueThresholdType;
					constraint def ValueLimit {
						limit:Real;
					}			
				}
			}	
		event occurrence containFailure{
		attribute def Timing {
					attribute timing : TimingThresholdType;
					constraint def TimeLimit {limit:Real;
					}
				}	
				attribute def Value {
					attribute value: ValueThresholdType;
					constraint def ValueLimit {
						limit:Real;
					}			
				}
			}
			#adversity connect Group3RequirementMetadata to functionalElementFails; 
			#copingStrategy connect Group3RequirementMetadata to 'containFailure';
	}
}	
		
		
		
				
				
   

