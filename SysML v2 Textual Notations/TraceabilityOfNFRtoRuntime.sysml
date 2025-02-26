package 'Traceability of NFR to Runtime' {
	private import ScalarValues::Real;
	private import 'Calculation Definitions'::*;
	private import 'Analytical Constraints'::*;
	private import USCustomaryUnits::*;
	private import SequenceFunctions::size;
	private import Quantities::ScalarQuantityValue;
	private import ControlFunctions::*;
	private import ScalarValues::Positive;
	
	requirement def NFR;
	//part def NFRSubject;
			part def RuntimeMonitors;
		  	part def Components;
		    part def CommunicationPaths;    
	    	part runtimeMonitors: RuntimeMonitors {
	    		part components:Components[0..*];
	    		part communicationPaths : CommunicationPaths[0..*];
		}

		requirement nFR:NFR;
		allocate nFR to runtimeMonitors;
	   
	analysis def RuntimeAnalysis {
		objective ilityReqAnalysisObjective {
		doc /*
		* The objective of this analysis is to determine whether the
		* subject system can satisfy the ility requirement by comparing constraints defined during the design
		*  and the actual value observed during implementation. This data can come from simulations, digital twins,
		*  or other dynamics analysis types 
		*/		
		}	
        return runtimeAnalysisResult;
        attribute dataLogs;
	}
	
	analysis runtimeAnalysis:RuntimeAnalysis;
	allocate nFR to runtimeAnalysis;   
}

