#!/bin/bash

# Create a large output file with repeated content
output_file="large_output.txt"

# Clear any existing files
> "$output_file"

# Log start message
echo "Starting to generate large output file..."

# Generate 5000 lines of content
for i in {1..5000}; do
    echo "Line $i: This is a large output file generated for testing purposes. It contains repeated text to create a substantial file size. Adding some random data: $(date +%s%N | cut -b1-10)" >> "$output_file"
done

# Log completion message
echo "Finished generating output file."
echo "Generated $(wc -l < "$output_file") lines of output." 