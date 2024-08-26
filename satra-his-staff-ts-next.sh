#!/bin/bash

# Define log file location
LOG_FILE="/tmp/build_audit.log"

# Step 1: Kill the process running with the name 'node' and on port 3000
echo "Killing the process running on port 3000 and any 'node' process..."
sudo fuser -k 3000/tcp
sudo pkill -f node

# Step 2: Delete the directory 'satra-his-staff-ts-next' with root access
echo "Deleting the directory /home/satra/hims/satra-his-staff-ts-next..."
sudo rm -rf /home/satra/hims/satra-his-staff-ts-next/satra-his-staff-ts-next/*

# Step 3: Copy the directory 'satra-his-staff-ts-next' from /tmp/Jenkins/ to /home/satra/hims/
echo "Copying the directory from /tmp/Jenkins/satra-his-staff-ts-next to /home/satra/hims/..."
sudo cp -r /tmp/Jenkins/satra-his-staff-ts-next/* /home/satra/hims/satra-his-staff-ts-next/satra-his-staff-ts-next/

# Step 4: Change to the satra-his-staff-ts-next directory
echo "Navigating to the directory /home/satra/hims/satra-his-staff-ts-next/satra-his-staff-ts-next..."
cd /home/satra/hims/satra-his-staff-ts-next/satra-his-staff-ts-next


# Ensure the directory is writable
mkdir -p $(dirname "$LOG_FILE")

# Step 5: # Install dependencies
sudo npm install --force
if [ $? -eq 0 ]; then
    echo "Successfully installed npm dependencies."
else
    echo "Failed to install npm dependencies."
    exit 1
fi

echo "Running 'npm run build:audit' in the background..."
nohup sudo npm run build:audit > "$LOG_FILE" 2>&1 &

if [ $? -eq 0 ]; then
    echo "Build process started successfully."
else
    echo "Failed to start the build process."
    exit 1
fi

echo "All tasks completed successfully!"
