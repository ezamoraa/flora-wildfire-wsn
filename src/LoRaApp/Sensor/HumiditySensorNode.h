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

#ifndef LORAAPP_SENSOR_HUMIDITYSENSORNODE_H_
#define LORAAPP_SENSOR_HUMIDITYSENSORNODE_H_

namespace flora {

class HumiditySensorNode : public SensorNode {
public:
    HumiditySensorNode();
    HumiditySensorNode(double inidata);
    virtual ~HumiditySensorNode();
    double getData() override;
    double forceFire() override;
};

} /* namespace flora */

#endif /* LORAAPP_SENSOR_HUMIDITYSENSORNODE_H_ */


//class TempSensorNode : public SensorNode  {
//public:
//    TempSensorNode();
//    TempSensorNode(double inidata);
//    virtual ~TempSensorNode();
//    double getData() override;
//    double forceFire() override;
////    void initialize() override;
////    void handleMessage(cMessage *msg) override;
//};
//
//}
