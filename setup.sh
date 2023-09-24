#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python is not installed. Installing Python..."
    # Install Python using Homebrew
    sudo brew install python
fi

# Prompt the user to install dependencies
read -p "Do you want to install dependencies? (y/n): " install_deps

if [[ "$install_deps" =~ ^[Yy]$ ]]; then
    # Install dependencies using pip3
   sudo pip3 install -r requirements.txt
fi

# Ask the user if they want to run main.py
read -p "Do you want to run main.py? (y/n): " run_main

if [[ "$run_main" =~ ^[Yy]$ ]]; then
    # Run main.py
   sudo python3 main.py
else
    echo "Exiting script..."
fi