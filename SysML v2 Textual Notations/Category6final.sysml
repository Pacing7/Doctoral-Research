//Library for Loss Driven Engineering Concepts  
package LossDrivenEngineeringLibrary {
	private import ScalarValues::*;
	private import Metaobjects::SemanticMetadata;
	
	//Adversity
	connection def Adversity {
   		end TechnicalElement;
			end GroupXRequirementMetadata;
  		}
		abstract connection adversities : Adversity[*] nonunique;
		metadata def <adversity> AdversityMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = adversities meta SysML::Usage;
		}
	//Loss
		connection def Loss {
   		end TechnicalElement;
			end GroupXRequirementMetadata;
  		}
		abstract connection losses : Loss[*] nonunique;
		metadata def <loss> LossMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = losses meta SysML::Usage;
			}
			
	//Coping Mechanism
	 connection def CopingStrategy {
   			end TechnicalElement;
			end GroupXRequirementMetadata;
  			}
  			
		abstract connection copingStrategies : CopingStrategy[*] nonunique;
		metadata def <copingStrategy> CopingStrategyMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = copingStrategies meta SysML::Usage;
			}
			}			
//Enumerations
library package IlityEnumerationsMetadata {
// Enumeration definition for the Timing Threshold Type of Measurement associated to the requirement
	enum def TimingThresholdType { within; before; exactlyAt; noLaterThan; every; afterConstraint; }
	
// Enumeration definition for the Value Threshold Type of Measurement associated to the requirement
	enum def ValueThresholdType { within; exactlyWith; notExceed; notLessThan; notGreaterThan; }
	
//Enumeration definition for the Ility Type associated to the requirement
	enum def IlityType {Safety; HumanSystemIntegration; Cybersecurity;
	} 
}						
//Technical element
	part def TechnicalElement;
// Requirement modeling  Group 6
library package Group6RequirementMetadata {					
	private import Metaobjects::SemanticMetadata;
	private import ModelingMetadata::*;
	private import ISQBase::*;
	private import ScalarValues::*;
	private import CauseAndEffect::*;
	private import IlityEnumerationsMetadata::*;
	private import LossDrivenEngineeringLibrary::*;
	 
   // Group 6 requirement modeling
  requirement TechnicalContainmentRequirement {
  	doc/* If it is detected that <<Technical Element : Logical Component || Hardware Unit>>
  	 *  <<failure associated to the functional element>>
		 * <<variation of Threshold Type and Constraint Choices>> then
		 * <<Action to contain the failure associated to the technicall element>> 
		 * << variation of Threshold Type and Constraint Choices>>.
		 */	 
		 enum ility : IlityType;
		//Definition of coping strategy constraint		
					
      subject technicalElement : TechnicalElement;
     	 event occurrence technicalElementFails {
       			attribute def technicalTiming {
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
		#adversity connect TechnicalContainmentRequirement to technicalElementFails;
		#copingStrategy connect TechnicalContainmentRequirement to containFailure;
		}	 
   }
   