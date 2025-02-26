//Group2RequirementMetadata
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
			end TechnicalDetectionRequirement;
			end TechnicalElement;
  		}
		abstract connection adversities : Adversity[*] nonunique;
		metadata def <adversity> AdversityMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = adversities meta SysML::Usage;
		}		
	//Coping Mechanism
	 connection def CopingStrategy {
   			end TechnicalElement;
			end TechnicalDetectionRequirement;
  			}
  			
		abstract connection copingStrategies : CopingStrategy[*] nonunique;
		metadata def <copingStrategy> CopingStrategyMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = copingStrategies meta SysML::Usage;
				}
			}
//Functional element
	part def FunctionalElement;	
		   
library package Group2RequirementMetadata {
				
	//Category 2: Technical Requirement	
	private import Metaobjects::SemanticMetadata;
	private import ModelingMetadata::*;
	private import ISQBase::*;
	private import ScalarValues::*;
	private import CauseAndEffect::*;
	private import IlityEnumerationsMetadata::*;
	private import LossDrivenEngineeringLibrary::*;
  
   // Category 2 requirement modeling
   requirement Group2RequirementMetadata {
		doc/* It should be detected <<Threshold Type and Constraint Choices>> if <<functional element>>
		 *  <<failure associated to the functional element>>
		* << Threshold Type and Constraint Choices>>.
		*/    	
       	enum ility : IlityType;     	
       	attribute def Timing {
					attribute timing: TimingThresholdType;
					constraint def TimeLimit {limit:Real;
					}
				}
			attribute def Value {
					attribute value:ValueThresholdType;
					constraint def ValueLimit {
						limit:Real;
					}				
				}						
       	subject functionalElement : FunctionalElement {
       		event occurrence functionalElementFails {
       			attribute def Timing {
					attribute timing: TimingThresholdType;
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
		#adversity connect Group2RequirementMetadata to 'functionalElementFails';
		}
	}
}
				
				
     
 







