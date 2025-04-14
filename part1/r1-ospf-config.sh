#!/bin/bash

# Configure OSPF on R1
docker exec -it r1 vtysh -c 'configure terminal' -c 'router ospf' -c 'ospf router-id 1.1.1.1' -c 'network 10.0.14.0/24 area 0.0.0.0' -c 'network 10.0.10.0/24 area 0.0.0.0' -c 'network 10.0.13.0/24 area 0.0.0.0' -c 'exit' -c 'exit'

# Set initial interface costs (matching actual interface assignments)
docker exec -it r1 vtysh -c 'configure terminal' -c 'interface eth0' -c 'ip ospf cost 10' -c 'exit' -c 'interface eth1' -c 'ip ospf cost 10' -c 'exit' -c 'interface eth2' -c 'ip ospf cost 20' -c 'exit' -c 'exit'

# Save the configuration
docker exec -it r1 vtysh -c 'write memory'

# Show the configuration
docker exec -it r1 vtysh -c 'show running-config'
