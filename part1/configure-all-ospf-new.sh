#!/bin/bash

# Make individual configuration scripts executable
chmod +x r1-ospf-config.sh
chmod +x r2-ospf-config.sh
chmod +x r3-ospf-config.sh
chmod +x r4-ospf-config.sh

# Run all configuration scripts
./r1-ospf-config.sh
./r2-ospf-config.sh
./r3-ospf-config.sh
./r4-ospf-config.sh

echo "OSPF configuration completed on all routers!"
