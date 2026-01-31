# 1. Create the Main Script (English Version)
cat << 'EOF' > kali.sh
#!/bin/bash
# Kali Linux Persistent (Data Safe) Loader
# A script to run Kali Linux in Docker with persistent storage.

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
    
    # Run a new container with a specific name (no --rm flag so data is saved)
    sudo docker run -it --name "$CONTAINER_NAME" kalilinux/kali-rolling /bin/bash
fi

echo "------------------------------------------------"
echo "Session Ended."
echo "To resume your work, run this script again."
EOF

# 2. Make the script executable
chmod +x kali.sh

# 3. Create English README.md
cat << 'EOF' > README.md
# Kali Linux Persistent Cloud Script

This is a Bash script to run **Kali Linux** inside any Cloud Environment (GitHub Codespaces, Google Cloud Shell, VPS) using Docker.

### Features
- **Persistent Storage:** Your files and installed tools are saved automatically.
- **Fast Boot:** Starts in less than 2 seconds.
- **Root Access:** Full root privileges included.

### How to use
1. Run the script:
   ```bash
   chmod +x kali.sh
   ./kali.sh
