import csv

# Input CSV file path (your existing file)
input_csv = '/home/rashmi/Documents/sem4/Project/Question-Answering-Chatbot/ML_chatbot/analysis.csv'

# Output CSV file path (new formatted file)
output_csv = 'converted_ml_topics.csv'

# Define headers for the new CSV
headers = ['chapter_name', 'source', 'text']

# Read from input and write to output
with open(input_csv, mode='r', encoding='utf-8') as infile, \
     open(output_csv, mode='w', newline='', encoding='utf-8') as outfile:
    
    reader = csv.DictReader(infile)
    writer = csv.writer(outfile)
    
    # Write the new header
    writer.writerow(headers)
    
    for row in reader:
        chapter_name = row['question'].strip()
        source = 'ML_notes_csv'
        text = row['answer'].strip()
        
        # Write the reformatted row
        writer.writerow([chapter_name, source, text])

print(f"✅ Converted CSV saved as '{output_csv}' successfully.")
