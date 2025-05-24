---
layout: post
title:  "Adopting Vim Organically"
date:   2025-05-24 06:20:24 +0700
categories: vim elixir
---

[Thai Version]({% post_url 2025-05-24-adopting-vim-organically-th %})

Currently, I’m spending my free time learning and practicing Elixir.
For a long time, I’ve wanted to learn and master a language other than Swift. At the same time, Elixir has always been on my list, ever since I bought *Programming in Elixir* years ago.

In 2025, I’ve finally decided to read the book and practice the language seriously. This is also a great opportunity for me to set up my Elixir development environment, and naturally, Vim is my first choice.

I’ve been using and practicing Vim motions for a long time, but mostly in combination with other IDEs, often relying on the mouse and arrow keys for tasks I’m more familiar with.

This time, however, I’m committing to a clean Terminal setup, using Vim as my sole IDE for learning Elixir. I started with no plugins, aiming to let my setup grow organically.

### What I Mean by “Organically”

By “organically,” I mean starting with a barebones Vim configuration—no plugins, no extra setup—just the default experience. As I encounter friction or inefficiencies, I introduce tools or tweaks that genuinely enhance my workflow.

For example:
- When my files became longer, relative line numbers became necessary for easier navigation.
- As the number of files in my directory increased, I decided to install NerdTree.
- When I got tired of constantly typing `:w` and `:!elixir stream_example.exs`, I set up a key mapping.
- When the default terminal theme and font strained my eyes, I changed the Vim colorscheme.

These are examples of how I selectively adjust configurations or install third-party plugins, rather than using a pre-configured setup, bootstrap scripts, or other software not included in a standard macOS setup (Neovim, iTerm2, etc.).

This approach may seem inefficient and slow me  down when tackling tasks, but since this is my free-time hobby, I enjoy the process. It allows me to have fun with programming—and, more broadly, interacting with computers.

On the other hand, it also forces me to work with minimal and manageable external dependencies, which I believe is key to sustaining a long-term career in software development.

![Vim Organic](/assets/2025-05-24-vim-organic.png)