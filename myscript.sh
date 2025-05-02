#!/bin/bash

# ---------------------------------------------------------

# Subdomain Enumeration

# Tools: subfinder, assetfinder, amass, sublist3r, httpx

# ---------------------------------------------------------

# Set the target domain and output directories

TARGET_DOMAIN=$1
OUTPUT_DIR="subdomain_recon_results"
SUBDOMAINS_FILE="$OUTPUT_DIR/subdomains.txt"
LIVE_SUBDOMAINS_FILE="$OUTPUT_DIR/live_subdomains.txt"

# Create necessary output directories

mkdir -p $OUTPUT_DIR

echo "[*] Starting subdomain enumeration for $TARGET_DOMAIN..."

# Step 1: Collect Subdomains

echo "[*] Running subfinder..."
subfinder -d $TARGET_DOMAIN -o $SUBDOMAINS_FILE

echo "[*] Running assetfinder..."
assetfinder --subs-only $TARGET_DOMAIN >> $SUBDOMAINS_FILE

echo "[*] Running findomain..."
findomain -t $TARGET_DOMAIN -o >> $SUBDOMAINS_FILE

# Step 2: Deduplicate Subdomains

echo "[*] Deduplicating subdomains..."
sort -u $SUBDOMAINS_FILE -o $SUBDOMAINS_FILE

echo "[*] Total subdomains collected: $(cat $SUBDOMAINS_FILE | wc -l)"

# Step 3: Filter Live Subdomains

echo "[*] Checking for live subdomains using httpx..."
cat $SUBDOMAINS_FILE | httpx -silent -o $LIVE_SUBDOMAINS_FILE

echo "[*] Total live subdomains: $(cat $LIVE_SUBDOMAINS_FILE | wc -l)" 

echo "[*] Subdomain enumeration completed."


