//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package flora.LoRaApp;

//import inet.power.storage.IdealEpEnergyStorage;
import inet.power.contract.IEnergyConsumer;
//import inet.physicallayer.wireless.common.contract.packetlevel.IMCU;


simple LoRaMCU 
{
    parameters:
 		@class(LoRaMCU);
 		//IEnergyConsumer.typename = default("LoRaAppEnergyConsumer");
 		
 		
 	gates:
 	    input mcuin;
 	    output mcuout;
 	    
// 	submodules:
// 	    EnergyConsumer:LoRaAppEnergyConsumer{
// 	    	@display("p = 150, 150");
// 	    }
 	     	    
}	    	
//        string energySourceModule = default("");           // module path of the energy source module which provides energy to the radio
//
//        string initialMCUMode @enum("sleep","run") = default("sleep");
//        string switchingTimes = default("ms 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"); // time parameters to switch between radio modes
//
//        *.energySourceModule = default(absPath(this.energySourceModule));
//        
//        @signal[mcuModeChanged](type=long);
//        @statistic[MCUMode](title="MCU mode"; source=mcuModeChanged; record=count,vector; interpolationmode=sample-hold);
//       
//        bool iAmGateway = default(false);

       
//        @display("bgb=215,413");
     
            
//    submodules:
//        IdealEpEnergyStorage: IdealEpEnergyStorage {
//            @display("p=160.962,245.196");
//        }
//
//        energyConsumer: <default("")> like IEnergyConsumer if typename != "" {
//            parameters:
//                @display("p=106.752,359.454");
//        }
        


