#!/bin/bash

# Ask the user for the title of the note
echo "Enter the title of the note:"
read title

# Ask user for note number
echo "Enter the note number:"
read note_number

# Create a new note file with the title and timestamp in the filename
timestamp=$(date +"%Y%m%d%H%M")
filename="[${timestamp}, ${note_number}] ${title}.md"
touch "$filename"

# Open the new note file in Visual Studio Code
code "$filename"

# Wait for user to finish editing note and close Visual Studio Code
while ps aux | grep -q "[V]isual Studio Code"; do sleep 1; done

# Add, commit, and push the new note file to GitHub
gh auth login
gh repo create
gh repo view --web

git add .
git commit -m "Add new note: $filename"
git push