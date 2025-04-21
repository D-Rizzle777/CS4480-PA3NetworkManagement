#!/bin/bash

# Restart FRR on all routers to ensure clean state
echo "Restarting FRR on all routers..."
for router in r1 r2 r3 r4; do
  docker exec -it $router service frr restart
  echo "Restarted FRR on $router"
done

# Wait for FRR to initialize
echo "Waiting for FRR to initialize..."
sleep 5

# Run the updated OSPF configurations
echo "Configuring OSPF on all routers..."
./r1-ospf-config.sh
./r2-ospf-config.sh
./r3-ospf-config.sh
./r4-ospf-config.sh

# Wait for OSPF to converge
echo "Waiting for OSPF to converge..."
sleep 10

# Verify OSPF neighbors
echo "Verifying OSPF neighbors:"
for router in r1 r2 r3 r4; do
  echo "OSPF neighbors on $router:"
  docker exec -it $router vtysh -c 'show ip ospf neighbor'
  echo "-------------------"
done

# Verify OSPF routes
echo "Verifying OSPF routes:"
for router in r1 r2 r3 r4; do
  echo "OSPF routes on $router:"
  docker exec -it $router vtysh -c 'show ip route'
  echo "-------------------"
done

echo "OSPF reconfiguration completed!"
