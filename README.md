## 🛠 Neovim Setup Requirements

To make all plugins, LSP servers, and formatters work correctly, the following runtimes/tools are required on your system.

| Tool / Plugin | Runtime Required | Install Command |
|---------------|-----------------|----------------|
| bash-language-server | Node.js | `npm install -g bash-language-server` |
| vscode-langservers-extracted (provides CSS, HTML, ESLint LSPs) | Node.js | `npm install -g vscode-langservers-extracted` |
| prettier | Node.js | `npm install -g prettier` |
| pyright | Node.js | `npm install -g pyright` |
| typescript-language-server | Node.js | `npm install -g typescript typescript-language-server` |
| black | Python 3.8+ | `sudo apt install pipx && pipx ensurepath && pipx install black` |

 

> **Note:**
> - `Git` obviously no need to explain.
> - `Node.js` is required for most LSP servers and formatters.  
> - `Python` is required for `black`.  
> - `NeoVim` v0.11 + is required.  
---

### Recommended Workflow

1. Install required runtimes (`node`, `npm`, `python3`).  
2. Restore your Neovim config and plugin backups.
   ```
   git clone https://github.com/NurMd07/nvim-setup.git
   cd nvim-setup
   chmod +x ./nv-sync.sh && ./nv-sync.sh
   ```
4. Run plugin sync:  

After restoring the config, open Neovim and run:

```vim
:Lazy sync
:Mason










