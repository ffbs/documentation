============
 Node Types
============
This section describes the different node types used in the network.

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

