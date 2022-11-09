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

#ifndef LORAAPP_SENSOR_SENSORNODE_H_
#define LORAAPP_SENSOR_SENSORNODE_H_
#include <omnetpp.h>

using namespace omnetpp;
namespace flora {

class SensorNode : public cSimpleModule {
protected:

    enum sensorType{
        TEMP = 1,
        HUMI,
        SMOKE
    };

    double lastData;
    int type;


public:



//    functions dont need to override
    void setLastData(double data);
    int  getType();
    double getLastData();


    SensorNode();
    virtual ~SensorNode();

//virtual functions
    virtual double getData() = 0;
    virtual double forceFire() = 0;

};

} /* namespace flora */

#endif /* LORAAPP_SENSOR_SENSORNODE_H_ */
