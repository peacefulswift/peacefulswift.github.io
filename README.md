```markdown
# 📘 Peaceful Swift Blog

This is technical blog built with [Jekyll](https://jekyllrb.com/). It contains articles on various topics

---

## 🛠 Requirements

- Ruby (recommend: [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/))
- [Bundler](https://bundler.io/)
- [Jekyll](https://jekyllrb.com/)

---

## 📦 Setup

1. **Clone this repo:**

   ```bash
   git clone git@github.com:peacefulswift/peacefulswift.github.io.git
   cd peacefulswift.github.io
   ```

2. **Install dependencies:**

   ```bash
   bundle install
   ```

3. **Run the development server:**

   ```bash
   bundle exec jekyll serve
   ```

   Then open your browser at: `http://localhost:4000`

---

## 🧱 Directory Structure

```text
.
├── _posts/             # Blog posts (Markdown files with dates)
├── _drafts/            # Drafts before publishing
├── _layouts/           # HTML layout templates
├── _includes/          # Reusable components (e.g. header, footer)
├── _config.yml         # Site configuration
├── assets/             # Images, CSS, JS
├── Gemfile             # Ruby dependencies
└── index.md            # Home page content
```

---

## ✍️ Writing Posts

1. **Create a new post manually:**

   ```bash
   touch _posts/2025-05-24-my-new-post.md
   ```

2. **Add front matter:**

   ```yaml
   ---
   layout: post
   title: "My New Post"
   date: 2025-05-24
   categories: [swift, ios]
   tags: [performance, memory]
   ---
   ```

3. **Drafts:**
   - Save work-in-progress articles in `_drafts/`
   - Preview drafts with:

     ```bash
     bundle exec jekyll serve --drafts
     ```

---

## 📤 Deploying

If using **GitHub Pages**:

- Push to `main` (or `gh-pages`) branch
- GitHub will automatically build and deploy the site

To manually build:

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

Upload the contents of `_site/` to your hosting server if not using GitHub Pages.

---

## 🧪 Common Commands

```bash
# Clean and rebuild
bundle exec jekyll clean
bundle exec jekyll build

# Serve with drafts
bundle exec jekyll serve --drafts
```

---

## 📌 Tips

- Use `_drafts/` to manage unfinished posts
- Use categories for post structure
- Use tags for better searchability
- Customize layouts in `_layouts/` and includes in `_includes/`

---

## 🔗 Useful Links

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Guide](https://pages.github.com/)
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

---

Happy writing ✍️
```
