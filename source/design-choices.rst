================
 Desgin Choices
================
During the design of the new Freifunk Infrastructure several desgin choices had
to be made, these are outlined here.

Use Routing everywhere and Mesh where needed
============================================
In the classical B.A.T.M.A.N. infrastructure,
the whole network is built upon layer two,
which includes every node in the network.
This results in broadcast traffic having to be sent to every node as well.
Routing information is also shared across the network,
resulting in a baseline traffic on every node,
even when the node itself is not actively communicating with the network.

In contrast, for this new infrastructure we are using routing between the
individual nodes and only employ the meshing protocol for routers which do not
have their own network connection.


Rely on modern VPN
==================
The fastd infrastructure is great,
but not especially fast on small nodes.
Recent developments have brought forth Wireguard,
which allows even the smallest routers (e.g. WR841N) to achieve speeds
to almost saturate a VDSL 50Mbit-Link (40MBit/s in our Last test).

This removes the long standing limitation of the small nodes not being
especially fast.
Together with the routing approach it should allow for faster network speeds for
all users.
