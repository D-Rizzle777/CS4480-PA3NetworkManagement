#!/bin/bash

# Display network interfaces on each router
echo "=== Network Interfaces ==="
for router in r1 r2 r3 r4; do
  echo "Interfaces on $router:"
  docker exec -it $router ip addr show | grep -E 'eth|inet'
  echo "-------------------"
done

# Display OSPF neighbors on each router
echo "=== OSPF Neighbors ==="
for router in r1 r2 r3 r4; do
  echo "OSPF neighbors on $router:"
  docker exec -it $router vtysh -c 'show ip ospf neighbor'
  echo "-------------------"
done

# Display OSPF routes on each router
echo "=== OSPF Routes ==="
for router in r1 r2 r3 r4; do
  echo "OSPF routes on $router:"
  docker exec -it $router vtysh -c 'show ip ospf route'
  echo "-------------------"
done

# Test connectivity from HostA to HostB
echo "=== Testing Connectivity ==="
echo "Ping from HostA to HostB:"
docker exec -it ha ping -c 4 10.0.3.2

# Show the path packets take (traceroute)
echo "=== Traceroute from HostA to HostB ==="
docker exec -it ha traceroute 10.0.3.2
