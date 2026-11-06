# Obsidian Setup

## Theme

- **[Shimmering Focus](https://github.com/chrisgrieser/shimmering-focus)** — install via Settings > Appearance > Themes > Browse, search "Shimmering Focus".

## Community Plugins

Install via Settings > Community Plugins > Browse.

### Style Settings

Used to customize theme and other style settings. After installing:

* Go to Settings > Style Settings > Shimmering Focus and turn **line numbers off**.
* Also make sure to set Shimmering Focus > Media > Image Size (Percent) to 100% instead of 50% to make images fully expand in the notebook

### Image Converter

Automatically converts and resizes images on paste. Important because Obsidian has a **5 MB file size limit on mobile** — large images will fail to sync or display. Configure it to compress images to stay well under that limit.

### Local REST API

Exposes a REST API for your vault, used to connect Obsidian with MCP servers and AI tools like Claude. After installing, go to Settings > Local REST API to find your **API key** — you'll need this when configuring the MCP server (e.g. `obsidian-mcp`).

### Dataview

Queries your vault and, with JavaScript enabled, runs small scripts inside notes. After installing, go to Settings > Dataview and turn on **Enable JavaScript Queries**. Without this setting, `dataviewjs` blocks show up as plain code.

I use it for a "Reset checklist" button on reusable packing lists (e.g. *Off to the mountains list*). Clicking the button unchecks every task in the note:

````markdown
```dataviewjs
const btn = dv.el("button", "Reset checklist");
btn.onclick = async () => {
  const file = app.vault.getAbstractFileByPath(dv.current().file.path);
  await app.vault.process(file, text => text.replace(/^(\s*[-*+] )\[[^ ]\]/gm, "$1[ ]"));
  new Notice("Checklist reset");
};
```
````

The button only renders in Reading view or Live Preview, and in Live Preview only when the cursor is outside the block. You can do the same thing without a plugin: press Cmd+H, replace `[x]` with `[ ]`, then click Replace all.
