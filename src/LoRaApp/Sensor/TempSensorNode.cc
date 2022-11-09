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

#include "TempSensorNode.h"

namespace flora {

Define_Module(TempSensorNode);

TempSensorNode::TempSensorNode() {
    // TODO Auto-generated constructor stub
    this->type = 1;
    this->lastData = uniform(15,20);
}

TempSensorNode::TempSensorNode(double inidata) {
    // TODO Auto-generated constructor stub
    this->type = 1;
    this->lastData = inidata;
}

TempSensorNode::~TempSensorNode() {
    // TODO Auto-generated destructor stub
}

double TempSensorNode :: getData(){
    if (lastData < -20){
        lastData += uniform(1,5);
    }else if (lastData < 60){
        if(uniform(0, 1) > 0.005 ){
            lastData += uniform(-1.5,1.5);
        }else{
            lastData += uniform(70,100);
        }
    }else{
        if ( uniform(0, 1) > 0.3 && lastData < 800.0){
            lastData += uniform(10,20);
        }else{
            lastData += uniform(-5,5);
        }
    }

    return lastData;
}

double TempSensorNode :: forceFire(){
    if(lastData < 100){
        lastData = uniform(100,120);
    }
    return lastData;
}

//void TempSensorNode :: initialize(){
//
//}
//
//void TempSensorNode :: (cMessage *msg){
//
//}

} /* namespace flora */
