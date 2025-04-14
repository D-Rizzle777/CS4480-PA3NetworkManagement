#!/bin/bash

# Configure OSPF on R4
docker exec -it r4 vtysh -c 'configure terminal' -c 'router ospf' -c 'ospf router-id 4.4.4.4' -c 'network 10.0.14.0/24 area 0.0.0.0' -c 'network 10.0.34.0/24 area 0.0.0.0' -c 'exit' -c 'exit'

# Set initial interface costs
docker exec -it r4 vtysh -c 'configure terminal' -c 'interface eth0' -c 'ip ospf cost 20' -c 'exit' -c 'interface eth1' -c 'ip ospf cost 20' -c 'exit' -c 'exit'

# Save the configuration
docker exec -it r4 vtysh -c 'write memory'

# Show the configuration
docker exec -it r4 vtysh -c 'show running-config'
