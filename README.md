
<div align="center">
<pre>
<img width="1011" height="239" alt="image" src="https://github.com/user-attachments/assets/226a4301-d0ea-46ad-89c6-e6c213bace02" />
</pre>


A fiercely forged Neovim configuration for the modern developer.

</div>

**NvShade** is a meticulously crafted Neovim configuration that emphasizes performance, clarity, and developer ergonomics. It is not a bloated framework, but a sharp, responsive tool that provides a complete IDE experience without sacrificing the speed and soul of Neovim.

It is built on a foundation of modern, community-standard plugins and a deep respect for the user's ability to customize their own tools.

---

### NvShade Screenshots
<div align="center">
<pre>
  <img width="1540" height="847" alt="image" src="https://github.com/user-attachments/assets/5f17fbed-988b-495d-886e-b90fdfda6e66" />
  <img width="1537" height="850" alt="image" src="https://github.com/user-attachments/assets/07bb6a7c-207b-4f7e-965a-aedf48a19206" />
</pre>

</div>

---

### The NvShade Philosophy

NvShade is built upon four guiding principles. Every feature, keymap, and design choice serves this philosophy.

*   **The Swift Shadow (Performance First):** NvShade must be imperceptibly fast. A sub-50ms startup is the standard, achieved through disciplined, strategic lazy-loading via `lazy.nvim`.
*   **The Forged Core (Modularity):** The configuration is built from strong, independent, and easily understood parts. The entire structure under `lua/forge/` is designed for maintainability and understanding.
*   **Light in the Shade (Intuitive Discovery):** Complexity is hidden until needed. The editor teaches you its features through discoverable keymaps (`which-key`) and a clear, consistent structure.
*   **The Master Template (Malleable):** NvShade provides a powerful default setup but makes it trivial to override any setting in a central `config.lua` file, allowing you to forge it into your own perfect tool.

### A Thanks

> "Bram Moolenaar's legacy made it possible for me to create NvShade. This distro is my small way of thanking him and the community, and of continuing the foundational philosophy of Vim/Neovim. The 'Help Uganda' button on the dashboard is a small tribute to that spirit."
>

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
---

## ⚙️ Post-Installation

1.  **Sync Plugins:** After the installation finishes, run `:Lazy sync` to ensure everything is correct.
2.  **Install Language Tools:** NvShade uses `mason.nvim` to manage your language servers and tools.
    *   Run `:Mason` to open the Mason UI.
    *   Use `i` to install your required tools (e.g., `pyright`, `tsserver`, `stylua`).
    *   Restart Neovim. NvShade will automatically configure any installed language server.

---

## 🎨 Customization

All your personal overrides belong in `lua/forge/config.lua`. This is the *only* file you should ever need to edit. This design ensures you can update NvShade with a `git pull` without losing your personal configurations.

```lua
-- Example: ~/.config/nvim/lua/forge/config.lua

local M = {}

-- Change the colorscheme to the sharp 'carbonfox'
M.theme = "carbonfox"

-- Enable a transparent background
M.transparent_bg = true

-- Add new plugins or disable default ones
M.plugins = {
  -- Add a new plugin
  ["github/copilot.vim"] = {
    event = "InsertEnter",
  },
  
  -- Disable a default plugin (e.g., the dashboard)
  ["goolord/alpha-nvim"] = {
    enabled = false,
  },
}

return M
```

---


## ⌨️ Key Bindings

NvShade uses **`<Space>`** as the leader key. Keybindings are mnemonic and discoverable via `which-key`.

| Category | Key           | Action                    |
| :------- | :------------ | :------------------------ |
| **Find** | `<leader>ff`  | **F**ind **F**iles        |
|          | `<leader>fg`  | **F**ind **G**rep (Text)  |
|          | `<leader>fb`  | **F**ind **B**uffers      |
|          | `<leader>fo`  | **F**ind **O**ld Files    |
| **Core** | `<leader>w`   | **W**rite (Save)          |
|          | `<leader>q`   | **Q**uit                  |
|          | `<leader>e`   | **E**xplorer (Toggle)     |
|          | `<C-h/j/k/l>` | Navigate Windows          |
|          | `<Tab>`       | Next Buffer               |
| **Git**  | `<leader>gg`  | Lazy**G**it Interface     |
|          | `<leader>gs`  | **S**tage Hunk            |
|          | `<leader>gr`  | **R**eset Hunk            |
|          | `]c` / `[c`   | Navigate Hunks            |
| **LSP**  | `gd`          | **G**o to **D**efinition  |
|          | `gr`          | **G**oto **R**eferences   |
|          | `K`           | **K**nowledge (Hover)     |
|          | `<leader>ca`  | **C**ode **A**ction       |

... and many more. Press `<Space>` and wait to see all available commands.

---

## 🩺 Troubleshooting

*   **Missing Icons?** Ensure you have installed and enabled a **Nerd Font** in your terminal's settings. This is the most common issue.
*   **LSP Not Working?**
    1.  Run `:LspInfo` to see if a language server is attached to the buffer.
    2.  Run `:Mason` to verify that the required LSP server is installed.
    3.  Run `:checkhealth` and inspect the LSP section for errors.
*   **Slow Startup?** Run `:Lazy profile` to identify potential bottlenecks in the plugin loading process.
*   **Seeing Garbled Text (Mojibake)?** Ensure your terminal is set to use UTF-8 encoding.

---

## Special thank:

*   **[NvChad](https://github.com/NvChad/NvChad):** For providing inspiration on how a clean, fast, and modular Neovim configuration can be structured.
*   **[Folke Postma](https://github.com/folke):** For creating `lazy.nvim` and many of the other essential plugins that power the modern Neovim ecosystem.

And of course, to Bram Moolenaar, for starting it all.

---

<div align="center">

*NvShade Forged*

</div>
