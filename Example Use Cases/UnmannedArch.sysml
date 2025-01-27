
package 'UmnannedSystem' {
	attribute def OnboardComputer;
	attribute def RemoteComputer;
	part def UnmannedSystemArchitecture {
	
		part batteryStorageModule;	
		part electricPropulsionSystem; 
		part computer {
			attribute onboardComputer : OnboardComputer;
			attribute remoteComputer : RemoteComputer;
		}
		part satelliteCommunicationSystem;
		part opticalCamera;
		part digitalTwinProcessingSystem;
		
	ref Bickford2020SystemsEngineering;
	}

package 'Requirements'{	
	requirement <'A'> services {
			doc /* The unmanned vehicle shall provide
			 *  littoral patrol services.
			 */
			subject system: UnmannedSystemArchitecture;
			}
	requirement <'B'> gps {
			doc /* The unmanned vehicle shall run missions based on GPS waypoints. */
			subject satelliteCommunicationSystem;
			}
	requirement <'C'> operator {
			doc /* The control operator shall monitor GPS position from a remote location . */
			subject onboardComputer;
			}
		}
}


