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

import inet.applications.contract.IApp;
import inet.networklayer.common.NetworkInterface;
//
// TODO auto-generated module
//
simple LoRaNodeApp like IApp
{
    parameters:
        @signal[LoRa_AppPacketSent](type=long); // optional
        @statistic[LoRa_AppPacketSent](source=LoRa_AppPacketSent; record=count);
        int numberOfPacketsToForward = default(0);

        volatile double timeToFirstTaskTimerTick @unit(s) = default(400s);
        volatile double timeToNextTaskTimerTick @unit(s) = default(10s);

        volatile double timeToFirstRoutingPacket @unit(s) = default(300s);
        string timeToNextRoutingPacketDist = default("uniform");
        volatile double timeToNextRoutingPacketMin @unit(s) = default(0s);
        volatile double timeToNextRoutingPacketMax @unit(s) = default(600s);
        volatile double timeToNextRoutingPacketAvg @unit(s) = default(300s);

        double initialLoRaTP @unit(dBm) = default(14dBm);
        double initialLoRaCF @unit(Hz) = default(868MHz);
        int initialLoRaSF = default(12);
        int minLoRaSF = default(7);
        int maxLoRaSF = default(12);
        double initialLoRaBW @unit(Hz) = default(125kHz);
        int initialLoRaCR = default(4);
        bool initialUseHeader = default(true);
        bool initialLoRaCAD = default(false);
        double initialLoRaCADatt @unit(dB) = default(10dB);
        bool evaluateADRinNode = default(false);
        int numberOfNodes;
        int routingMetric = default(0);
        bool routeDiscovery = default(true);
        double ownDataPriority = default(1);
        int windowSize = default(10);
        int packetTTL = default(1);
        double routingPacketPriority = default(0.5);
        bool storeBestRouteOnly = default(false);
        bool getRoutesFromDataPackets = default(true);
        volatile double routeTimeout @unit(s) = default(60s);
        bool requestACKfromApp = default(false);
        bool stopOnACK = default(true);
        bool AppACKReceived = default(false);
        bool increaseSF = default(false);
        int packetsPerSF = default(1);
        int packetsInSF = default(0);
        bool sendPacketsContinuously = default(false);
        bool onlyNode0SendsPackets = default(false);
        bool enforceDutyCycle = default(true);
        double dutyCycle = default(0.01);
        int numberOfDestinationsPerNode = default(1);
        int numberOfPacketsPerDestination = default(1);
        int dataPacketDefaultSize @unit(B) = default(50B);
        int routingPacketMaxSize @unit(B) = default(16B);
        volatile double stopRoutingAfterDataDone @unit(s) = default(3600s);
        int forwardedPacketVectorSize = default(10);
        int packetsToForwardMaxVectorSize = default(0);

        string initialAppMode @enum("sleep","run") = default("sleep");
        string switchingTimes = default("ms 0 0 0 0"); // time parameters to switch between app modes

        double averageUpdateSensorWeight = default(0.25);
        double iniTemperature = default(20);
        double iniHumidity = default(50);
        double temperatureFireThreshold = default(70);
        double humidityFireThreshold = default(0.2);

        volatile double timeToForceFireStart @unit(s) = default(1000s);
        bool forceFireSensors = default(false);
        bool forceFireCondition = default(false);
        int fireAlarmGatewayNodeId = default(0);
        bool fireAlarmEnable = default(false);
        bool fireAlarmOnce = default(false);

        volatile double commActivePeriod @unit(s) = default(60s);
        double commActiveDutyCycle = default(0.1);
        double commActiveTxRatio = default(0.9); // fraction of time at in commActive window during which Tx is allowed (after this only Rx)

        @signal[commActiveChanged](type=long);
        @statistic[commActive](title="Communication Active"; source=commActiveChanged; record=count,vector; interpolationmode=sample-hold);

        @signal[appModeChanged](type=long);
        @statistic[appMode](title="App mode"; source=appModeChanged; record=count,vector; interpolationmode=sample-hold);

        @display("bgb=314,348");
    gates:
        input socketIn @labels(LoRaAppPacket/up);
        output socketOut @labels(LoRaAppPacket/down);
}
