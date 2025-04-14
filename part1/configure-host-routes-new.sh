#!/bin/bash

# Configure routes on HostA
echo "Configuring routes on HostA..."
# Add a default route via R1
docker exec -it ha ip route add default via 10.0.1.1

# Configure routes on HostB
echo "Configuring routes on HostB..."
# Add a default route via R3
docker exec -it hb ip route add default via 10.0.3.1

echo "Host routes configured successfully!"
