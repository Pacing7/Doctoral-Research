library package LossDrivenSpecialtyAreaMetadata {
	 private import Base::Anything;
		private import ScalarValues::String;
		private import ScalarValues::Boolean;
	metadata def Ility {
		 attribute isMandatory : Boolean;
		 
		attribute def Adversity {
			attribute adversity : String;
			}
			
		attribute def Loss {
			attribute loss : String;
			}
		attribute def CopingStrategy {
			attribute copingStrategy : String;
			}

// Safety Area Metadata
}
	metadata def Safety :> Ility {
		attribute def Failure { 
			attribute failure : Adversity;
			}

		attribute def Accident {
			attribute acciddent : Loss;
			}
		attribute def Mitigation {
			attribute mitigation : CopingStrategy;
			}
}
// Human System Integration Area Metadata

metadata def HumanSystemIntegration :> Ility {
		attribute def Competency { 
			attribute competency : Adversity;
			}

		attribute def Consequence {
			attribute consequence : Loss;
			}
		attribute def HumanMitigation {
			attribute humanMitigation : CopingStrategy;
			}
}

// Cybersecurity Area Metadata

metadata def Cybersecurity :> Ility {
		attribute def Threat { 
			attribute threat : Adversity;
			}

		attribute def Attack {
			attribute attack : Loss;
			}
		attribute def Countermeasure {
			attribute countermeasure : CopingStrategy;
			}
}
}
