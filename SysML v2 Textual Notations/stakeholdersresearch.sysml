

// Stakeholder definition
part def 'Systems Engineering';
part def 'Systems Safety Engineering';
part def 'Human System Integration';
part def 'Cybersecurity';
// Concern definition
// systems engineering
concern 'engineering activities' {
doc /*
* Design Engineers execute daily engineering activities to meet customer needs. These stakeholders maintain high 
* data integrity across the lifecycle and traceability of system specifications and software specifications to product 
* design.
*/
stakeholder 'Systems Engineering';
ref SEBoK;
// systems safety engineering
concern 'systems safety engineering activities' {
doc /*
* discipline concerned with minimizing hazards related to hardware and software elements of a system that can result
* in a mishap with an expected severity and with a predicted probability.
*/
stakeholder 'Systems Safety Engineering';
ref SEBoK;
}
// human system integration
concern  'human system integration activities' {
doc /*
* comprehensive management and technical approach applied to systems development and integration as part of a 
* wider SE process focused on addressing human considerations within system engineering and logistics processes to   
* optimize total system performance
*/
stakeholder 'Human System Integration';
ref SAE;
}
// cybersecurity
concern  'cybersecurity activities' {
doc /*
* discipline focused on the prevention of damage to, protection of, and restoration of computers, electronic 
* communications systems, electronic communications services, wire communication, and electronic communication, 
* including information contained therein, to ensure its availability, integrity, authentication, confidentiality, and nonrepudiation.
*/
stakeholder 'Cybersecurity';
ref NIST;
}
}