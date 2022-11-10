/*

 * LoRaMCU.h
 *
 *  Created on: 7 Nov 2022
 *  Author: sasa
*/


#ifndef LORAAPP_LORAMCU_H_
#define LORAAPP_LORAMCU_H_

#include <omnetpp.h>
#include <string>

using namespace omnetpp;

namespace flora {

class LoRaMCU :  public cSimpleModule

{

};
};
// namespace inet


#endif  LORAAPP_LORAMCU_H_

/*

    protected:
      simtime_t switchingTimes[MCU_MODE_SWITCHING][MCU_MODE_SWITCHING];

      MCUMode MCUMode = MCU_MODE_SLEEP;

      MCUMode nextMCUMode = MCU_MODE_RUN;

      MCUMode previousMCUMode = MCU_MODE_SLEEP;

      cMessage *switchTimer = nullptr;


    protected:
      void parseMCUModeSwitchingTimes();
      void startMCUModeSwitch(MCUMode newMCUMode, simtime_t switchingTime);
      void completeMCUModeSwitch(MCUMode newMCUMode);

    protected:
      virtual void initialize(int stage) override;
      virtual void initializeMCUMode();


public:
  LoRaMCU() { }
  virtual ~LoRaMCU();

//  bool iAmGateway;
//  double getCurrentTxPower();
//  void setCurrentTxPower(double txPower);
*/
