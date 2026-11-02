#!/bin/bash

# Define input and output directory paths
input_dir="cds"
output_dir="carveme"

# Loop over all .faa files in the input directory
for filename in "$input_dir"/*.faa; do
  # Extract the filename without extension from the path
  # (e.g., "cds/genome_A.faa" -> "genome_A")
  basename=$(basename "$filename" .faa)
  
  # Construct the output file path
  # (e.g., "carveme/genome_A_model.xml")
  output_path="${output_dir}/${basename}_model.xml"

  # Run CarveMe
  # Specify the output path with the -o / --output flag
  carve "$filename" -o "$output_path" -g M9,LB
done