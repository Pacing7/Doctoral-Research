//Group1RequirementsMetadata 
library package IlityEnumerationsMetadata {
	
	// Enumeration definition for the Design Type associated to the requirement
	enum def DesignType { 
		enum system;
		enum component; 
		enum designItem;
		enum unitOfObservation;
	}
	// Enumeration definition for the Prevention Type associated to the requirement
	enum def PreventionType { avoid; notCause; notAllow; notBe; noT; no; }
	//Enumeration definition for the Ility Type associated to the requirement
	enum def IlityType {Safety; HumanSystemsIntegration; Cybersecurity;
	} 
}

//Library for Loss Driven Engineering Concepts  
package LossDrivenEngineeringLibrary {
	private import ScalarValues::*;
	private import Metaobjects::SemanticMetadata;
	
	//Adversity
	connection def Adversity {
   		end FunctionalElement;
			end GroupXRequirementMetadata;
  		}
		abstract connection adversities : Adversity[*] nonunique;
		metadata def <adversity> AdversityMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = adversities meta SysML::Usage;
		}
	//Loss
		connection def Loss {
   		end TopLevelRequirement;
			end harm;
  		}
		abstract connection losses : Loss[*] nonunique;
		metadata def <loss> LossMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = losses meta SysML::Usage;
			}
			
	//Coping Mechanism
	 connection def CopingStrategy {
   			end FunctionalElement;
			end GroupXRequirementMetadata;
  			}
  			
		abstract connection copingStrategies : CopingStrategy[*] nonunique;
		metadata def <copingStrategy> CopingStrategyMetadata :> SemanticMetadata {
			:>> annotatedElement : SysML::ConnectionUsage;
			:>> baseType = copingStrategies meta SysML::Usage;
			}				
		
		
		 
		}
// Ility Requirements Templates 		

// Requirement modeling
	library package Group1RequirementMetadata {
		private import IlityEnumerationsMetadata::*;
		private import ScalarValues::*;
		private import LossDrivenEngineeringLibrary::*;
		
	//Group 1:Top level requirement
		requirement TopLevelRequirement {
			doc/* The <<System || Component || DesignItem || Unit of Observation >> shall 
			 * <<avoid || not cause || not allow || not be || not || no >> <<harm>>.
			 */
				subject design:DesignType;
				
					enum ility : IlityType;
			
					attribute def Prevention {
						attribute prevention : PreventionType;
					}
					event occurrence harm;
					#loss connect TopLevelRequirement to harm; 	
					}
				}
				
		
