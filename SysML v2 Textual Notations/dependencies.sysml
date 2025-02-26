//Dependencies
private import ModelingMetadata::Rationale;

part def 'Team 1';
part def 'Team 2';
part def 'Team 3';
part def 'Team 4';

dependency X
 from 'Team 1' to 'Team 2';
dependency Y
 from 'Team 2' to 'Team 3',  'Team 4';

 // Example
 // Stakeholder dependecies
part def 'Systems Engineering';
part def 'Systems Safety Engineering';
part def 'Human System Integration';
part def 'Cybersecurity';
  	
 metadata dependeciesRationale : Rationale { 
 	text = 
 	" X = Contributing. one requirement contributes to concerns in another domain.
 	Y = Mitigating. one requirement depends on another domain to mitigate concerns";
 }
 