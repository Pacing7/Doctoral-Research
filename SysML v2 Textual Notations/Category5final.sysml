//Group5RequirementMetadata
library package IlityEnumerationsMetadata {
// Enumeration definition for the Timing Threshold Type of Measurement associated to the requirement
	enum def TimingThresholdType { within; before; exactlyAt; noLaterThan; every; afterConstraint; }
	
// Enumeration definition for the Value Threshold Type of Measurement associated to the requirement
	enum def ValueThresholdType { within; exactlyWith; notExceed; notLessThan; notGreaterThan; }
	
// Enumeration definition for the Design Type associated to the requirement
	enum def DetectionType { monitor; detect;}
	
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
library package Architecture {
	part def TechnicalElement;	
	part def LogicalComponent;	
	part def HardwareUnit;
}


//Category 5: // Technical Containment Requirement		   
library package Group5RequirementMetadata {					
	private import Metaobjects::SemanticMetadata;
	private import ModelingMetadata::*;
	private import ISQBase::*;
	private import ScalarValues::*;
	private import CauseAndEffect::*;
	private import IlityEnumerationsMetadata::*;
	private import LossDrivenEngineeringLibrary::*;
	private import Architecture::*;
	
   // Category 5 Requirement modeling  
	requirement TechnicalDetectionRequirement {
	doc/* <<Logical Component || Hardware Unit>> shall <<monitor || detect>> << variation of 
	 * Threshold Type and Constraint Choices>> if <<Logical Component || Hardware Unit 
	 * (or its properties e.g. signals, ports) >> Associated to the <<functional element>> is 
	 * <<action>> << variation of Threshold Type and Constraint Choices>>.
	*/
		enum ility : IlityType;
		 // subject technicalElement : TechnicalElement;
		  subject detection : DetectionType;
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
			part technicalElement : TechnicalElement {
				part logicalComponent : LogicalComponent;
				part hardwareUnit : HardwareUnit;	
			event occurrence conditionOfTechnicalElement {
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
			}
		}		
			#adversity connect TechnicalDetectionRequirement to technicalElement;
			#copingStrategy connect TechnicalDetectionRequirement to detection;			
	}				
}
