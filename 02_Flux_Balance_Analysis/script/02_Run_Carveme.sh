#!/bin/bash

# ==============================================================================
# Automated Metabolic Model Reconstruction using CarveMe
# Target: Renamed protein sequences (.faa)
# Media: M9 and LB (Gap-filling)
# ==============================================================================

# 0. Set current directry
# cd /path/to/ECORMA/02_Flux_Balance_Analysis
# To run this script: script/02_Run_Carveme.sh

# 1. Setup paths
INPUT_DIR="cds/renamed"
OUTPUT_DIR="carveme"
LOG_DIR="logs"

# Ensure directories exist
mkdir -p "$OUTPUT_DIR"
mkdir -p "$LOG_DIR"

# 2. Check if CarveMe is available in the current environment
if ! command -v carve &> /dev/null; then
    echo "Error: 'carve' command not found. Please activate your environment (e.g., conda activate CarveMe)."
    exit 1
fi

echo "Starting CarveMe reconstruction for files in $INPUT_DIR..."

# 3. Iterate through .faa files
for filename in "$INPUT_DIR"/*.faa; do
    # Skip if no .faa files are found
    [ -e "$filename" ] || continue

    # Extract base name (e.g., ECOR11)
    basename=$(basename "$filename" .faa)
    output_path="${OUTPUT_DIR}/${basename}_model.xml"
    log_path="${LOG_DIR}/${basename}.log"

    # Skip if the output model already exists (resume-friendly)
    if [ -f "$output_path" ]; then
        echo "Skipping $basename: Model already exists."
        continue
    fi

    echo "Processing: $basename"
    
    # 4. Execute CarveMe
    # -g: specifies multiple media for gap-filling to ensure model functionality
    # Redirect stdout and stderr to a log file for debugging
    carve "$filename" \
        -o "$output_path" \
        -g M9,LB \
        > "$log_path" 2>&1

    # Check execution status
    if [ $? -eq 0 ]; then
        echo "Successfully reconstructed: $basename"
    else
        echo "Error: Failed to process $basename. Check log at $log_path"
    fi
done

echo "CarveMe processing complete."
date