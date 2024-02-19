# This code will create a .csv file from .txt file and also indicate the exact path where the output file is created


import csv
import os

# Define the file paths
input_file_path = '/Users/aparnapant/Aparna/Documents/Self Exploratory Analysis/SQL Lesson/encounters.txt'
output_file_path = '/Users/aparnapant/Aparna/Documents/Self Exploratory Analysis/SQL Lesson/Python/encounters.csv'

# Open the .txt file
with open(input_file_path, 'r') as txtfile:
    # Read the content
    lines = txtfile.readlines()

# Define a delimiter if it's not comma-separated
delimiter = ','

# Open the .csv file in write mode
with open(output_file_path, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile, delimiter=delimiter)

    # Assuming each line contains comma-separated values
    for line in lines:
        # Split the line into individual values

        values = line.strip().split(delimiter)
        
        # Write each row to the CSV file
        writer.writerow(values)

# Print the absolute path of the output file
print("CSV file created at:", os.path.abspath(output_file_path)
