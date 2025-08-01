=============================
 Services and Infrastructure
=============================
This section provides a basic description of the used software packages in the
FFBS network.

Etcd
====
Etcd provides a clustered key-value store accessible via http(s). It is used
between the concentrator nodes to provide configuration storage for the network.

Wireguard
=========
Wireguard is a new in kernel VPN solution (`project link
<http://www.wireguard.org/>`_). It is much faster than the fastd tunnelling
solution in the old network and should provide faster client networking speeds.

Lua
===
The Lua programming language is used extensively on the client nodes, e.g. to
retrieve the client configuration and configure the router accordingly.

Python
======
Python is used in the backend services, e.g. expose endpoints for the client
configuration retrieval. The backend services talk to the etcd service via a
localhost connection.

Gluon
=====
`Gluon <https://github.com/freifunk-gluon/gluon>`_ is a build system
and package collection to build embedded router firmwares
for Freifunk Communities.
It is based on `OpenWrt <https://openwrt.org>`_.

Vagrant
=======
Vagrant is used as the testbed for ansible development. Take note that in order
to use the ffbs-ansible repository, you'll have to setup your vagrant as
described in the ffbs-ansible repository readme.

Nodeconfig
==========
The nodeconfig programm on the gluon nodes is responsible for loading/generating
the wireguard connection key and fetching the initial configuration from etcd
for the gluon node.

.. seqdiag::
   :align: center

   seqdiag {
       node; etcd; concentrator
       node -> node [label = "fetch or load wireguard key"];
       node -> etcd [label = "GET /config?(pubkey,nonce,v6mtu,version)"];
       node <-- etcd [label = "JSON configuration"];
       node -> node [label = "apply wireguard config (nodeconfig.lua)"];
       node -> concentrator [label = "wireguard connection"];
   }

The node first checks for it's own wireguard private key and if it does not
exist generates a new one. Then the configuration is requested with the
wireguard public key, a random nonce, the v6mtu and the firmware version.
The etcd server than returns a valid configuration in the form of a JSON object,
which the nodeconfig.lua uses to configure the wireguard interfaces for
the concentrators.
The public key is added to the concentrator wireguard interfaces in parallel
and the device is than connected to the freifunk network via wireguard.
