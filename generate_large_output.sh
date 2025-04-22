#!/bin/bash

# Create multiple large output files with repeated content
echo "Starting to generate large output files..."

# Generate 100 files
for file_num in {1..100}; do
    output_file="large_output_${file_num}.txt"
    
    # Clear any existing file
    > "$output_file"
    
    # Generate 5000 lines of content for each file
    for i in {1..5000}; do
        echo "Line $i: This is a large output file generated for testing purposes. It contains repeated text to create a substantial file size. Adding some random data: $(date +%s%N | cut -b1-10)" >> "$output_file"
    done
done

# Log completion message
echo "Finished generating output files."
echo "Generated 100 files with 5000 lines each." 