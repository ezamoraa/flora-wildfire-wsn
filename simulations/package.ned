package flora.simulations;

import inet.applications.udpapp.UdpBasicApp;
import inet.node.inet.Router;
import inet.node.internetcloud.InternetCloud;
import flora.LoRaPhy.LoRaMedium;
import flora.LoraNode.LoRaNode;
import flora.LoraNode.LoRaGW;
import inet.node.inet.StandardHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.visualizer.contract.IIntegratedVisualizer;
import inet.node.ethernet.Eth1G;

@license(LGPL);
network LoRaNetworkTest
{
    parameters:
        int numberOfNodes = default(1);
        int numberOfGateways = default(1);
        int networkSizeX = default(500);
        int networkSizeY = default(500);
        @display("bgb=355.824,356.832");
    submodules:
        loRaNodes[numberOfNodes]: LoRaNode {
            @display("p=83.664,233.856");
        }
        loRaGW[numberOfGateways]: LoRaGW {
            @display("p=83.664,150.192;is=s");
        }
        LoRaMedium: LoRaMedium {
            @display("p=167.328,88.704");
        }
        networkServer: StandardHost {
            parameters:
                @display("p=208.24002,27.216002");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = false;
                @display("p=207.64801,88.704");
        }
        internetCloud: InternetCloud {
            @display("p=83.664,27.216002");
        }
        gwRouter[numberOfGateways]: Router {
            @display("p=24.192001,27.216002");
        }
        nsRouter: Router {
            @display("p=138.09601,27.216002");
        }
    connections:
        networkServer.ethg++ <--> Eth1G <--> nsRouter.ethg++;
        nsRouter.pppg++ <--> Eth1G <--> internetCloud.pppg++;
        for i=0..numberOfGateways-1 {
            internetCloud.pppg++ <--> Eth1G <--> gwRouter[i].pppg++;
            gwRouter[i].ethg++ <--> Eth1G <--> loRaGW[i].ethg++;
        }
}

network LoRaMotoNetworkTest
{
    parameters:
        int numberOfNodes = default(1);
        int numberOfGateways = default(1);
        int networkSizeX = default(1400);
        int networkSizeY = default(2500);
        //@display("bgb=1400,2500;bgi=background/coquimbo-02;bgl=2");
        @display("bgb=2500,2500;bgl=2");
    submodules:
        N[numberOfNodes]: LoRaNode {
            @display("p=801.28,115.184006;is=n");
        }
        loRaGW[numberOfGateways]: LoRaGW {
            @display("p=2423.872,95.152;is=n");
        }
        LoRaMedium: LoRaMedium {
            @display("p=1231.968,115.184006;is=l;i=misc/sun");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = false;
                @display("p=2088.336,95.152");
        }
        networkServer: StandardHost {
            parameters:
                @display("p=1697.712,95.152");
        }
    connections:
}


network LoRaMesh
{
    parameters:
        int numberOfNodes = default(1);
        int numberOfGateways = default(1);
        int networkSizeX = default(3000);
        int networkSizeY = default(2500);
//        @display("bgb=1400,2500;bgi=background/coquimbo-02;bgl=2");
        @display("bgb=3000,2500;bgl=2");
    submodules:
        loRaNodes[numberOfNodes]: LoRaNode {
            @display("p=831.328,580.92804;is=n");
        }
        loRaGW[numberOfGateways]: LoRaGW {
            @display("p=610.976,-55.088;is=s");
        }
        LoRaMedium: LoRaMedium {
            @display("p=-200,-200");
        }
        networkServer: StandardHost {
            parameters:
                @display("p=2100,-200");
        }
        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=2500,-200");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                assignDisjunctSubnetAddresses = false;
                @display("p=2900,-200");
        }
        internetCloud: InternetCloud {
            @display("p=1300,-200");
        }
        gwRouter[numberOfGateways]: Router {
            @display("p=900,-200");
        }
        nsRouter: Router {
            @display("p=1700,-200");
        }
    connections:
        networkServer.ethg++ <--> Eth1G <--> nsRouter.ethg++;
        nsRouter.pppg++ <--> Eth1G <--> internetCloud.pppg++;
        for i=0..numberOfGateways-1 {
            internetCloud.pppg++ <--> Eth1G <--> gwRouter[i].pppg++;
            gwRouter[i].ethg++ <--> Eth1G <--> loRaGW[i].ethg++;
        }
}
