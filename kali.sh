#!/bin/bash
# Kali Linux Persistent (Data Safe) Loader

CONTAINER_NAME="kali_hacking_machine"

echo "------------------------------------------------"
echo "   Kali Linux: Persistent Storage Mode          "
echo "------------------------------------------------"

# 1. Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "[!] Docker not found. Installing Docker..."
    sudo apt-get update && sudo apt-get install -y docker.io
fi

# 2. Check if an old machine exists
if sudo docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "[+] Existing machine found! Resuming session..."
    echo "[*] Starting container: $CONTAINER_NAME"
    
    # Start and attach to the existing container
    sudo docker start -ai "$CONTAINER_NAME"
else
    echo "[+] Creating a NEW persistent machine..."
    echo "[*] Data will be saved in container: $CONTAINER_NAME"
    echo "[!] Note: Type 'exit' to leave the session."
    
    # Run a new container
    sudo docker run -it --name "$CONTAINER_NAME" kalilinux/kali-rolling /bin/bash
fi

echo "------------------------------------------------"
echo "Session Ended."
echo "To resume your work, run this script again."
