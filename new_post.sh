#!/bin/bash

# Prompt for the post name
read -p "Enter the post title: " post_title

# Convert title to lowercase, replace spaces with hyphens, remove non-alphanumeric characters
slug=$(echo "$post_title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-|-$//g')

# Get the current date
date=$(date +%Y-%m-%d)

# Create filename
filename="_posts/${date}-${slug}.md"

# Create the file with Jekyll front matter
cat <<EOF > "$filename"
---
layout: post
title: "$post_title"
date: $(date '+%Y-%m-%d %H:%M:%S %z')
categories: []
tags: []
---

Write your post content here.
EOF

echo "New post created: $filename"
