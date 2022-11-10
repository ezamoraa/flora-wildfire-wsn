//
//
// * LoRaMCU.cc
// *
// *  Created on: 7 Nov 2022
// *  Author: sasa

#include "LoRaMCU.h"

namespace flora {

Define_Module(LoRaMCU);


};
/*
void LoRaMCU::initialize(int stage){
    cSimpleModule::initialize(stage);

        switchTimer = new cMessage("switchTimer");
        initializeMCUMode();

        parseMCUModeSwitchingTimes();
}
void LoRaMCU::initializeMCUMode() {
    const char *initialMCUMode = par("initialMCUMode");
    if (!strcmp(initialRadioMode, "sleep"))
        completeMCUModeSwitch(IMCU::MCU_MODE_SLEEP);
    else if (!strcmp(initialRadioMode, "run"))
        completeMCUModeSwitch(IMCU::MCU_MODE_RUN);
    else
        throw cRuntimeError("Unknown initialMCUMode");
}
void LoRaMCU::setMCUMode(MCUMode newMCUMode)
{
    Enter_Method("setMCUMode");
    if (newMCUMode < MCU_MODE_OFF || newMCUMode > MCU_MODE_SWITCHING)
        throw cRuntimeError("Unknown MCU mode: %d", newMCUMode);
    else if (newMCUMode == MCU_MODE_SWITCHING)
        throw cRuntimeError("Cannot switch manually to MCU_MODE_SWITCHING");
    else if (MCUMode == MCU_MODE_SWITCHING || switchTimer->isScheduled())
        throw cRuntimeError("Cannot switch to a new MCU mode while another switch is in progress");
    else if (newMCUMode != MCUMode && newMCUMode != nextMCUMode) {
        simtime_t switchingTime = switchingTimes[MCUMode][newMCUMode];
        if (switchingTime != 0)
            startMCUModeSwitch(MCUMode, switchingTime);
        else
            completeMCUModeSwitch(newMCUMode);
    }
}

void LoRaMCU::parseMCUModeSwitchingTimes()
{
    const char *times = par("switchingTimes");

    char prefix[3];
    unsigned int count = sscanf(times, "%s", prefix);

    if (count > 2)
        throw cRuntimeError("Metric prefix should be no more than two characters long");

    double metric = 1;

    if (strcmp("s", prefix) == 0)
        metric = 1;
    else if (strcmp("ms", prefix) == 0)
        metric = 0.001;
    else if (strcmp("ns", prefix) == 0)
        metric = 0.000000001;
    else
        throw cRuntimeError("Undefined or missed metric prefix for switchingTimes parameter");

    cStringTokenizer tok(times + count + 1);
    unsigned int idx = 0;
    while (tok.hasMoreTokens()) {
        switchingTimes[idx / MCU_MODE_SWITCHING][idx % MCU_MODE_SWITCHING] = atof(tok.nextToken()) * metric;
        idx++;
    }
    if (idx != MCU_MODE_SWITCHING * MCU_MODE_SWITCHING)
        throw cRuntimeError("Check your switchingTimes parameter! Some parameters may be missed");
}

void LoRaMCU::startMCUModeSwitch(MCUMode newMCUMode, simtime_t switchingTime)
{
    EV_DETAIL << "Starting to change MCU mode from \x1b[1m" << getMCUModeName(MCUMode) << "\x1b[0m to \x1b[1m" << getMCUModeName(newMCUMode) << "\x1b[0m." << endl;
    previousMCUMode = MCUMode;
    MCUMode = MCU_MODE_SWITCHING;
    nextMCUMode = newMCUMode;
    emit(mcuModeChangedSignal, MCUMode);
    scheduleAfter(switchingTime, switchTimer);
}

void LoRaMCU::completeMCUModeSwitch(MCUMode newMCUMode)
{
    EV_INFO << "MCU mode changed from \x1b[1m" << getMCUModeName(previousMCUMode) << "\x1b[0m to \x1b[1m" << getMCUModeName(newMCUMode) << "\x1b[0m." << endl;
    if (!isReceiverMode(newMCUMode) && receptionTimer != nullptr)
        abortReception(receptionTimer);
    if (!isTransmitterMode(newMCUMode) && transmissionTimer->isScheduled())
        abortTransmission();
    MCUMode = previousMCUMode = nextMCUMode = newMCUMode;
    emit(mcuModeChangedSignal, newMCUMode);
}



void LoRaMCU::handleStartOperation(LifecycleOperation *operation)
{
    // NOTE: we ignore radio mode switching during start
    initializeMCUMode();
}

void LoRaMCU::handleStopOperation(LifecycleOperation *operation)
{
    // NOTE: we ignore radio mode switching and ongoing transmission during shutdown
    cancelEvent(switchTimer);
    completeMCUModeSwitch(RADIO_MODE_OFF);
}

void LoRaMCU::handleCrashOperation(LifecycleOperation *operation)
{
    cancelEvent(switchTimer);
    completeMCUModeSwitch(RADIO_MODE_OFF);
}
//void LoRaMCU:: switchmode(){}



//double LoRaRadio::getCurrentTxPower()
//{
//    return currentTxPower;
//}
//
//void LoRaRadio::setCurrentTxPower(double txPower)
//{
//    currentTxPower = txPower;
//}

} // namespace inet
*/
