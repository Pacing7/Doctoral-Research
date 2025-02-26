// Enumerations 
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