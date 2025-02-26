//Verification evidence traceability
package Reqs {
	requirement def Requirement1 {
		doc /* ... */
	}
	requirement def Requirement2 {
		doc /* ... */
	}
	requirement def Requirement3 {
		doc /* ... */
	}
	
	requirement requirement1 : Requirement1;
  	requirement requirement2 : Requirement2;
	requirement requirement3 : Requirement3;
}

package ReqsVerification {
	private import Reqs::*;
	private import VerificationCases::*;
	
	//verification Case for Requirement 1
	verification def VerificationCase1 {			
		objective {
			verify requirement : Requirement1;
		}
		return verdict : VerdictKind;
	}
	//verification Case for Requirement 2
	verification def VerificationCase2 {			
		objective {
			verify requirement : Requirement2;
		}
		return verdict : VerdictKind;
	}
	
	//verification Case for Requirement 3
	verification def VerificationCase3 {			
		objective {
			verify requirement : Requirement3;
		}
		return verdict : VerdictKind;
	}
}

//viewpoint with evidence 
package 'Viewpoint' {
	private import Reqs::*;
	private import VerificationCases::*;
	private import ReqsVerification::*;
		
	part def 'Systems Engineer';
	part def 'Customer';
	part def 'IV&V';
	requirement def CUSTOMER;	
	
	requirement concernCombinedRequirement : CUSTOMER {
   		require requirement1;
   		require requirement2;
		require requirement3; 	
	}
	
	concern 'CUSTOMERs definition' {
		doc /* 
		 * To ensure that all CUSTOMERs requirements are documented
		 */	 
		stakeholder se : 'Systems Engineer';
		stakeholder customer : 'Customer';
		
	}
	
	concern 'verification evidence' {
		doc /*
	
		 * all CUSTOMER requirements have to pass for the concern to be addressed.
		 * If all requirements don't pass there needs to be further evaluation. 
		 */
		 
		 stakeholder se : 'Systems Engineer';
		 stakeholder customer : 'Customer';
		 stakeholder ivv : 'IV&V';
	}
	
	viewpoint 'Traceability of verification artifacts' {		
		frame 'CUSTOMERs definition';
		frame 'verification evidence';
		
		require constraint {
			doc /*
			
			 * A traceability view for CUSTOMERs shall show all CUSTOMERs 
			 * with associated verification verdicts.
			 */
		}
		require concernCombinedRequirement;
		
		//This is a combined verification case. if all requirements pass, then the verdict 
		//is Pass and the concern is addressed.
		//If all requirements don't pass, then there needs to be further evaluation 
		verification def CustomerStakeholderConcern {
			objective concernCombinedVerificationObjective {
 			verify requirement concernCombinedRequirement;
 			}					 
			PassIf((requirement1(verdict = pass)),
			  	(requirement2(verdict = pass)),
			  	(requirement3(verdict = pass))) 		
		}
	}
}
