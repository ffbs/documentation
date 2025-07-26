============
 Node Types
============
This section describes the different node types used in the Freifunk Parker
network from Freifunk Braunschweig.

Concentrator
============
The concentrators provides persistent storage functionalities for the network
and routes traffic from its connected clients to an exit node. The concentrator
provides the configuration for the client node type via the etcd service.

Exit
====
Exit nodes are the edge nodes which provide internet access to the FFBS network.
They use Freifunk Rheinland as the exit network and need to provide NAT for this
service.

Client
======
Client nodes provide network access to the end users. This is done either via a
wireless service as an AP or to a local LAN via a seperate ethernet port on the
node. Client nodes are usually embedded wireless routers flashed with the FFBS
firmware.

FFBS network diagram sample
===========================
.. nwdiag::
   :desctable:

   nwdiag {
     inet [shape = cloud];
     inet -- c1;

     network freifunk {
       address = "172.16.x.x/12"
       c1 [address = "172.16.1.1"];
       c2 [address = "172.16.1.2"];
     }
     network wg-nodes {
       address = "10.x.x.x/8"
       c1 [address = "10.0.0.1"];
       c2 [address = "10.0.0.2"];
       ap1 [address = "10.12.212.177/22"]
       ap2 [address = "10.20.212.144/22"]
     }
     network client-net1 {
       address = "10.12.212.x/22";
       ap1 [address = "10.12.212.177/22"];
     }

     network client-net2 {
       address = "10.20.212.x/22";
       ap2 [address = "10.20.212.144/22"];
     }
   }

The diagram shows a minimized cutout of the Freifunk Braunschweig Parker network
architecture. Internet is provided to the ``c1`` node via Freifunk Rheinland via a
GRE tunnel. The ``freifunk`` network as displayed above is not a physical
connection via a network switch and instead consists of wireguard tunnels
between the concentrator nodes (``c1``, ``c2``) in the above diagram.

The ``c1`` node provides NAT for the ipv4 network traffic in the infrastructure.
The ``wg-nodes`` network is also not a physical link and instead consists of the
client access point creating a wireguard link to two different concentrators.
This is useful since the infrastructure can steer access points between
concentrators and these can switch to the backup link to a different
concentrator without requesting a new configuration.
