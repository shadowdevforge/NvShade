<div align="center">
<pre>
<img width="1175" height="249" alt="image" src="https://github.com/user-attachments/assets/7b67aba9-5e76-4587-b014-611f8ece3c32" />
</pre>

A fiercely forged Neovim configuration for the modern developer. **Version 1.1.0**

</div>

<div align="center">

✨ **View the live, interactive website at [shadowdevforge.github.io/NvShade/](https://shadowdevforge.github.io/NvShade/)** ✨

</div>

**NvShade** is a meticulously crafted Neovim configuration that emphasizes performance, clarity, and developer ergonomics. It is not a bloated framework, but a sharp, responsive tool that provides a complete IDE experience without sacrificing the speed and soul of Neovim.

It is built on a foundation of modern, community-standard plugins and a deep respect for the user's ability to customize their own tools.

---

### NvShade Screenshots
<div align="center">
<pre>
<img width="1563" height="882" alt="image" src="https://github.com/user-attachments/assets/334e4be9-5860-43f8-a2a3-de25d0ac46cb" />
<img width="1562" height="884" alt="image" src="https://github.com/user-attachments/assets/fcfcd412-390f-4764-b160-fb8e7c8962a4" />
</pre>
</div>

---

## 🆕 What's New in v1.1.0

### Enhanced Theme System
- **Dynamic Theme Switching:** Integrated `themery.nvim` for seamless theme exploration
- **Expanded Theme Collection:** Now includes 15+ curated colorschemes:
  - Catppuccin variants (Latte, Frappé, Macchiato, Mocha)
  - Nightfox family (Nightfox, Duskfox, Nordfox, Terafox, Carbonfox, Dawnfox, Dayfox)
  - Nord
  - Synthweave (standard & transparent)
- **Live Preview:** See themes in real-time before applying
- **Quick Access:** Press `<leader>t` or use the dashboard button to explore themes

### Refined User Experience
- **Improved Dashboard:** Added Theme Explorer button for instant customization
- **Better Plugin Integration:** Seamless coordination between bufferline, nvim-tree, and themes
- **Enhanced Autocomplete:** Optimized cmp configuration with better source priorities
- **Smarter Keybindings:** More intuitive shortcuts with improved which-key integration

### Performance & Stability
- **Optimized Lazy Loading:** Strategic event-based loading reduces startup time
- **Better Error Handling:** Graceful fallbacks for missing dependencies
- **Cleaner Architecture:** Improved modularity in plugin specifications

---

### The NvShade Philosophy

NvShade is built upon four guiding principles. Every feature, keymap, and design choice serves this philosophy.

*   **The Swift Shadow (Performance First):** NvShade must be imperceptibly fast. A sub-50ms startup is the standard, achieved through disciplined, strategic lazy-loading via `lazy.nvim`.
*   **The Forged Core (Modularity):** The configuration is built from strong, independent, and easily understood parts. The entire structure under `lua/forge/` is designed for maintainability and understanding.
*   **Light in the Shade (Intuitive Discovery):** Complexity is hidden until needed. The editor teaches you its features through discoverable keymaps (`which-key`) and a clear, consistent structure.
*   **The Master Template (Malleable):** NvShade provides a powerful default setup but makes it trivial to override any setting in a central `config.lua` file, allowing you to forge it into your own perfect tool.

### A Thanks

> "Bram Moolenaar's legacy made it possible for me to create NvShade. This distro is my small way of thanking him and the community, and of continuing the foundational philosophy of Vim/Neovim. The 'Help Uganda' button on the dashboard is a small tribute to that spirit."

---

## 🚀 Installation

### Prerequisites

*   **Neovim v0.8.0+** ([Install Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim))
*   **A Nerd Font** ([FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads) is recommended).
*   **Git** (for installation and updates).
*   **A C Compiler** (for `nvim-treesitter`).
    *   **Linux/macOS:** `gcc` or `clang` (usually pre-installed or via `build-essential`, `Xcode Command Line Tools`, etc.).
    *   **Windows:** [Build Tools for Visual Studio](https://visualstudio.microsoft.com/visual-cpp-build-tools/) (Install the "Desktop development with C++" workload).

### Install NvShade

Choose your operating system and run the commands in your terminal.

<details>
<summary><strong>🐧 Linux / macOS</strong></summary>

1.  **Backup your existing configuration** (important!):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.backup
    ```

2.  **Clone NvShade**:
    ```bash
    git clone https://github.com/shadowdevforge/NvShade.git ~/.config/nvim
    ```

</details>

<details>
<summary><strong>🪟 Windows (Powershell)</strong></summary>

1.  **Backup your existing configuration** (important!):
    ```powershell
    Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
    ```

2.  **Clone NvShade**:
    ```powershell
    git clone https://github.com/shadowdevforge/NvShade.git $env:LOCALAPPDATA\nvim
    ```

</details>

<br>

Finally, **launch Neovim**. On the first run, `lazy.nvim` will automatically install all plugins.

```bash
nvim
```

### Updating to v1.1.0

If you're upgrading from a previous version:

```bash
cd ~/.config/nvim  # or $env:LOCALAPPDATA\nvim on Windows
git pull
nvim +Lazy sync
```

---

## ⚙️ Post-Installation

1.  **Sync Plugins:** After the installation finishes, run `:Lazy sync` to ensure everything is correct.
2.  **Explore Themes:** Press `t` on the dashboard or run `:Themery` to browse the theme collection.
3.  **Install Language Tools:** NvShade uses `mason.nvim` to manage your language servers and tools.
    *   Run `:Mason` to open the Mason UI.
    *   Use `i` to install your required tools (e.g., `pyright`, `tsserver`, `stylua`).
    *   Restart Neovim. NvShade will automatically configure any installed language server.

---

## 🎨 Customization

All your personal overrides belong in `lua/forge/config.lua`. This is the *only* file you should ever need to edit. This design ensures you can update NvShade with a `git pull` without losing your personal configurations.

```lua
-- Example: ~/.config/nvim/lua/forge/config.lua

local M = {}

M.plugins = {
  -- Override telescope layout
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "vertical",
      },
    },
  },
  
  -- Disable a default plugin
  { "goolord/alpha-nvim", enabled = false },
  
  -- Add a new plugin
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },
}

return M
```

### Theme Customization

With v1.1.0, you can easily switch themes:

1. **Via Themery UI:** Press `t` on the dashboard or use `:Themery`
2. **Via Dashboard:** Click the "🎨 Theme Explorer" button
3. **Via Keymap:** Use `<leader>t` in normal mode

---

## ⌨️ Key Bindings

NvShade uses **`<Space>`** as the leader key. Keybindings are mnemonic and discoverable via `which-key`.

| Category  | Key            | Action                    |
| :-------- | :------------- | :------------------------ |
| **Find**  | `<leader>ff`   | **F**ind **F**iles        |
|           | `<leader>fg`   | **F**ind **G**rep (Text)  |
|           | `<leader>fb`   | **F**ind **B**uffers      |
|           | `<leader>fo`   | **F**ind **O**ld Files    |
|           | `<leader>fh`   | **F**ind **H**elp         |
|           | `<leader>fc`   | **F**ind Git **C**ommits  |
| **Core**  | `<leader>w`    | **W**rite (Save)          |
|           | `<leader>q`    | **Q**uit                  |
|           | `<leader>Q`    | Force **Q**uit All        |
|           | `<leader>e`    | **E**xplorer (Toggle)     |
|           | `<C-h/j/k/l>`  | Navigate Windows          |
|           | `<Tab>`        | Next Buffer               |
|           | `<S-Tab>`      | Previous Buffer           |
|           | `<S-H>`        | Previous Buffer (Alt)     |
|           | `<S-L>`        | Next Buffer (Alt)         |
| **Theme** | `<leader>t`    | **T**heme Explorer        |
| **Git**   | `<leader>gg`   | Lazy**G**it Interface     |
|           | `<leader>gs`   | **S**tage Hunk            |
|           | `<leader>gu`   | **U**ndo Stage Hunk       |
|           | `<leader>gr`   | **R**eset Hunk            |
|           | `<leader>gp`   | **P**review Hunk          |
|           | `<leader>gb`   | **B**lame Line            |
|           | `<leader>gd`   | **D**iff This             |
|           | `]c` / `[c`    | Navigate Hunks            |
| **LSP**   | `gd`           | **G**o to **D**efinition  |
|           | `gr`           | **G**oto **R**eferences   |
|           | `gI`           | **G**oto **I**mplementation |
|           | `K`            | **K**nowledge (Hover)     |
|           | `<leader>ca`   | **C**ode **A**ction       |
|           | `<leader>rn`   | **R**e**n**ame            |
|           | `<leader>D`    | Type **D**efinition       |
| **Edit**  | `<C-s>`        | Save File (Insert/Normal) |
|           | `;`            | Command Mode              |
|           | `Y`            | Yank to End of Line       |
|           | `<leader>y`    | Copy to Clipboard (Visual)|
|           | `<leader>yy`   | Copy Line to Clipboard    |

... and many more. Press `<Space>` and wait to see all available commands.

---

## 🏗️ Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - bootstraps lazy.nvim
├── lua/
│   └── forge/
│       ├── init.lua           # Main conductor - loads modules in order
│       ├── config.lua         # Your personal configuration
│       ├── core/
│       │   ├── options.lua    # Editor settings
│       │   ├── keymaps.lua    # Key bindings
│       │   └── autocmds.lua   # Autocommands
│       ├── lsp/
│       │   └── init.lua       # LSP configuration
│       └── plugins/
│           ├── init.lua       # Plugin manifest
│           ├── theme.lua      # Theme configurations
│           ├── themery.lua    # Theme switcher (NEW in v1.1.0)
│           ├── ui.lua         # UI components
│           ├── telescope.lua  # Fuzzy finder
│           ├── treesitter.lua # Syntax highlighting
│           ├── cmp.lua        # Autocompletion
│           ├── mason.lua      # LSP installer
│           ├── nvim-tree.lua  # File explorer
│           ├── bufferline.lua # Buffer tabs
│           ├── alpha.lua      # Dashboard
│           └── ... (and more)
```

---

## 🩺 Troubleshooting

*   **Missing Icons?** Ensure you have installed and enabled a **Nerd Font** in your terminal's settings. This is the most common issue.
*   **LSP Not Working?**
    1.  Run `:LspInfo` to see if a language server is attached to the buffer.
    2.  Run `:Mason` to verify that the required LSP server is installed.
    3.  Run `:checkhealth` and inspect the LSP section for errors.
*   **Slow Startup?** Run `:Lazy profile` to identify potential bottlenecks in the plugin loading process.
*   **Seeing Garbled Text (Mojibake)?** Ensure your terminal is set to use UTF-8 encoding.
*   **Theme Not Loading?** Run `:Themery` to select a theme, or check `:Lazy` to ensure theme plugins are installed.

---

## 📦 Included Plugins

NvShade comes with a carefully curated set of plugins:

### Core
- **lazy.nvim** - Modern plugin manager
- **plenary.nvim** - Lua utility functions

### UI & Aesthetics
- **Catppuccin** - Soothing pastel theme (default)
- **Nightfox** - Highly customizable theme collection
- **Nord** - Arctic, north-bluish theme
- **Synthweave** - Retro synthwave aesthetic
- **Themery** - Live theme switcher *(NEW)*
- **lualine.nvim** - Sleek statusline
- **bufferline.nvim** - Buffer tabs
- **alpha-nvim** - Dashboard
- **nvim-web-devicons** - File icons
- **which-key.nvim** - Keymap discovery

### Editing
- **nvim-treesitter** - Advanced syntax highlighting
- **Comment.nvim** - Smart commenting
- **nvim-autopairs** - Auto-close pairs
- **nvim-cmp** - Autocompletion engine
- **LuaSnip** - Snippet engine

### Navigation
- **telescope.nvim** - Fuzzy finder
- **nvim-tree.lua** - File explorer

### Development
- **mason.nvim** - LSP/tool installer
- **nvim-lspconfig** - LSP configurations
- **gitsigns.nvim** - Git integration
- **lazygit.nvim** - Git UI

---

## 🤝 Contributing

Contributions are welcome! Whether it's:
- Bug reports
- Feature requests
- Plugin suggestions
- Documentation improvements

Please open an issue or submit a pull request.

---

## 📝 Changelog

### v1.1.0 (Current)
- Added Themery for dynamic theme switching
- Expanded theme collection (15+ themes)
- Improved plugin integration
- Enhanced dashboard with theme explorer
- Optimized autocomplete configuration
- Better which-key integration
- Performance improvements

### v1.0.0
- Initial release
- Core plugin setup
- LSP integration
- Basic theme support

---

## 🙏 Special Thanks

*   **[NvChad](https://github.com/NvChad/NvChad):** For providing inspiration on how a clean, fast, and modular Neovim configuration can be structured.
*   **[Folke Postma](https://github.com/folke):** For creating `lazy.nvim` and many of the other essential plugins that power the modern Neovim ecosystem.

And of course, to **Bram Moolenaar**, for starting it all.

---

## 📄 License

NvShade is open source and available under the MIT License.

---

<div align="center">

**NvShade v1.1.0**

*NvShade forged*

[⭐ Star on GitHub](https://github.com/shadowdevforge/NvShade) • [🐛 Report Bug](https://github.com/shadowdevforge/NvShade/issues) • [💡 Request Feature](https://github.com/shadowdevforge/NvShade/issues)

</div>
