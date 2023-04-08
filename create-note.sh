#!/bin/bash

# Ask the user for the title of the note
echo "Enter the title of the note:"
read title

# Ask user for note number
echo "Enter the note number:"
read note_number

# Create a new note file with the title and timestamp in the filename
timestamp=$(date +"%Y%m%d%H%M")
filename="[${note_number}, ${timestamp}] ${title}.md"
touch "$filename"

# Open the new note file in Visual Studio Code
code "$filename"

# Add, commit, and push the new note file to GitHub
gh auth login
gh repo create
gh repo view --web

git add .
git commit -m "Add new note: $filename"
git push