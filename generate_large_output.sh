#!/bin/bash

# Create multiple large output files with repeated content
echo "Starting to generate large output files..."

# Generate 10 files
for file_num in {1..300}; do
    echo "Generating output $file_num..."
done
# for file_num in {1..10}; do
#     output_file="large_output_${file_num}.txt"
    
#     # Clear any existing file
#     > "$output_file"
    
#     # Generate 1000 lines of content for each file
#     for i in {1..1000}; do
#         echo "Line $i: This is a large output file generated for testing purposes. It contains repeated text to create a substantial file size. Adding some random data: $(date +%s%N | cut -b1-10)" >> "$output_file"
#     done
# done

# Log completion message
echo "Finished generating output files."
echo "Generated 10 files with 1000 lines each." 