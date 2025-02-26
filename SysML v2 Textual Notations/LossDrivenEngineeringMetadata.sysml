
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
   		end FunctionalElement;
			end GroupXRequirementMetadata;
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
		
		
		//usages examples 
		}
		
		//#adversity connect 'functionalElementFails' to GroupXRequirementMetadata;
		//#copingStrategy connect 'containFailure' to GroupYRequirementMetadata;
		