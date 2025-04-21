# CS4480 Network Management Assignment - Part 2

## Setup Instructions

1. Clone the repository:

   ```
   git clone <repository-url>
   cd CS4480-PA3NetworkManagement
   ```

2. Make the orchestrator and part one scripts executable:

   ```
   chmod +x part1/*.sh
   chmod +x part2/Daniel_Wong_u1347597.py
   ```

3. Set up the network topology(will take a while):

   ```
   ./part2/Daniel_Wong_u1347597.py --setup-all
   ```

4. Control traffic paths:

   - Move traffic to north path (R1-R2-R3):
     ```
     ./part2/Daniel_Wong_u1347597.py --north
     ```
   - Move traffic to south path (R1-R4-R3):
     ```
     ./part2/Daniel_Wong_u1347597.py --south
     ```
   - Toggle between paths:
     ```
     ./part2/Daniel_Wong_u1347597.py --toggle
     ```

5. Test connectivity:
   ```
   ./part2/Daniel_Wong_u1347597.py --test
   ```

## Demo Video Instructions

The demo video shows the following:

1. System identification (hostname, creator, user_urn, etc.)
2. Help output of the orchestrator
3. Traffic movement between north and south paths without packet loss
4. Verification using tcpdump on different nodes

## Repository Structure

- `part1/`: Contains the original topology setup scripts
- `part2/`: Contains the orchestrator script
- `README.md`: This file'
