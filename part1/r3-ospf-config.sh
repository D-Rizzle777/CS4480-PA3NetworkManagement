#!/bin/bash

# Configure OSPF on R3
docker exec -it r3 vtysh -c 'configure terminal' -c 'router ospf' -c 'ospf router-id 3.3.3.3' -c 'network 10.0.11.0/24 area 0.0.0.0' -c 'network 10.0.12.0/24 area 0.0.0.0' -c 'network 10.0.15.0/24 area 0.0.0.0' -c 'exit' -c 'exit'

# Set initial interface costs
docker exec -it r3 vtysh -c 'configure terminal' -c 'interface eth0' -c 'ip ospf cost 10' -c 'exit' -c 'interface eth1' -c 'ip ospf cost 20' -c 'exit' -c 'interface eth2' -c 'ip ospf cost 10' -c 'exit' -c 'exit'

# Save the configuration
docker exec -it r3 vtysh -c 'write memory'

# Show the configuration
docker exec -it r3 vtysh -c 'show running-config'
