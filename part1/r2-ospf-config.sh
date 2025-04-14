#!/bin/bash

# Configure OSPF on R2
docker exec -it r2 vtysh -c 'configure terminal' -c 'router ospf' -c 'ospf router-id 2.2.2.2' -c 'network 10.0.10.0/24 area 0.0.0.0' -c 'network 10.0.11.0/24 area 0.0.0.0' -c 'exit' -c 'exit'

# Set initial interface costs
docker exec -it r2 vtysh -c 'configure terminal' -c 'interface eth0' -c 'ip ospf cost 10' -c 'exit' -c 'interface eth1' -c 'ip ospf cost 10' -c 'exit' -c 'exit'

# Save the configuration
docker exec -it r2 vtysh -c 'write memory'

# Show the configuration
docker exec -it r2 vtysh -c 'show running-config'
