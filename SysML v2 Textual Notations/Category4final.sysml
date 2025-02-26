library package IlityEnumerationsMetadata {
	
	// Enumeration definition for the Design Type associated to the requirement
	enum def DesignType { system; component; designItem; }

	// Enumeration definition for the Prevention Type associated to the requirement
	enum def PreventionType { avoid; notCause; notAllow; notBe; noT; no; }

// Enumeration definition for the Timing Threshold Type of Measurement associated to the requirement
	enum def TimingThresholdType { within; before; exactlyAt; noLaterThan; every; afterConstraint; }
	
// Enumeration definition for the Value Threshold Type of Measurement associated to the requirement
	enum def ValueThresholdType { within; exactlyWith; notExceed; notLessThan; notGreaterThan; }

// Enumeration definition for the Design Type associated to the requirement
	enum def DetectionType { monitor; detect;
	}
	
	//Enumeration definition for the Ility Type associated to the requirement
	enum def IlityType {Safety; HumanSystemIntegration; Cybersecurity;
	} 
}

//Group4RequirementMetadata 

library package Group4RequirementMetadata {
				
	//Category 4: Technical Requirement	
	private import Metaobjects::SemanticMetadata;
	private import ModelingMetadata::*;
	private import ScalarValues::String;
	private import CauseAndEffect::*;
	private import IlityEnumerationsMetadata::*;	
	// Definitions	
	part def FunctionalElement;	
	part def LogicalComponent;	
	part def HardwareUnit;
	action def DetectAndHandle;
		
		// Category 4 Requirement modeling
			requirement def TechnicalRequirement {
			doc/* Detect and Handle << type of violation>> to mitigate << failure cause>> of
			 * <<Logical Component || Hardware Unit (or its properties e.g. signals, ports) >>
			 *  Associated to the  <<functional element>>.
			 */
			 	enum ility : IlityType;
				subject detectAndHandle : DetectAndHandle;	
					// Usages 
			part functionalElement : FunctionalElement {
			part logicalComponent : LogicalComponent;
			part hardwareUnit : HardwareUnit;				
						event occurrence violation;
						event occurrence failureCause;
						}
						event occurrence functionalElementFails;											
							#multicausation connection {
							end #cause ::> functionalElement.violation;
							end #cause ::> functionalElement.failureCause;
							end #effect ::> functionalElementFails;
		}							         
	}
}