#!/bin/bash

# Create a large output file with repeated content
output_file="large_output.txt"
echo "Starting to generate large output file..." > "$output_file"

# Generate 5000 lines of content
for i in {1..5000}; do
    echo "Line $i: This is a large output file generated for testing purposes. It contains repeated text to create a substantial file size. Adding some random data: $(date +%s%N | cut -b1-10)" >> "$output_file"
done

echo "Finished generating output file." 