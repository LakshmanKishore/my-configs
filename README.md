This repo contains all my customaizations.

## Python Environment Setup with uv

### Create Centralized Virtual Environment
```bash
uv venv "$HOME\.uv_envs\<env_name>" --python 3.11.15
```

### PowerShell Activation Helper

Add to `$PROFILE` (edit via `notepad $PROFILE`):

```powershell
function VenvActivate {
    param([string]$EnvName)
    
    $TargetScript = "$HOME\.uv_envs\$EnvName\Scripts\Activate.ps1"
    
    if (Test-Path $TargetScript) {
        & $TargetScript
    } else {
        Write-Error "Environment '$EnvName' not found in $HOME\.uv_envs\"
    }
}

Set-Alias -Name act -Value VenvActivate

# Tab completion for act
Register-ArgumentCompleter -CommandName VenvActivate -ParameterName EnvName -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
    
    Get-ChildItem "$HOME\.uv_envs\" -Directory | 
        Where-Object { $_.Name -like "$wordToComplete*" } | 
        ForEach-Object { 
            [System.Management.Automation.CompletionResult]::new($_.Name, $_.Name, 'ParameterValue', $_.Name) 
        }
}
```

### Usage
```powershell
act <envname>
uv pip install -r requirements.txt
```

# Neovim Configuration for VS Code (vscode-neovim)

This repository contains my personal Neovim configuration, specifically optimized for use with the **vscode-neovim** extension in Visual Studio Code.

## 🚀 Installation Guide (Windows - No Admin Required)

Since I often work on machines without administrator privileges, I use the **portable** version of Neovim.

### 1. Install Neovim
1. Go to the [Neovim Releases page](https://github.com/neovim/neovim/releases).
2. Download the latest `nvim-win64.zip` file.
3. Extract the zip folder to a location within your user directory where you have write access. 
   * *Recommended:* `C:\Users\<YourUsername>\Documents\installations\nvim-win64`
4. To verify it works, open PowerShell, navigate to the folder, and run:
   ```powershell
   .\bin\nvim.exe --version
   ```

### 2. Configure VS Code
1. Install the **[vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim)** extension from the VS Code Marketplace.
2. Open VS Code Settings (`Ctrl + ,`) and search for `neovim executable`.
3. In the **"Vscode-neovim: Neovim Executable Paths: Win32"** setting, paste the full path to your `nvim.exe`:
   ```text
   C:\Users\<YourUsername>\Documents\installations\nvim-win64\bin\nvim.exe
   ```

### 3. Apply These Keybindings
To use these specific shortcuts, place the vscode-keybindings.lua file in your Neovim config directory:

1. Open PowerShell and run:
   ```powershell
   # Create the plugin directory if it doesn't exist
   New-Item -ItemType Directory -Force -Path "$env:LOCALAPPDATA\nvim\after\plugin"
   
   # Copy the file content and place it in the above created directory.
   ```
2. Reload VS Code (`Ctrl + Shift + P` -> `Developer: Reload Window`).

## ⌨️ Keybindings Highlights

My configuration uses `<Space>` as the Leader key. Here are the most useful shortcuts:

| Shortcut | Action |
| :--- | :--- |
| `<Space> s` | Save File |
| `<Space> f` | Quick Open File |
| `<Space> j` | Quick Open Previous Recently Used Editor In Group |
| `<Space> p` | Show All Commands |
| `<Leader> tt` | New Tab |
| `<Leader> tc` | Close Current Tab |

## 📂 Project Structure

*   `after/plugin/vscode-keybindings.lua`: Contains all custom keybindings that interact with VS Code commands.
*   `init.lua`: (If you add one later) The main entry point for general Neovim settings.

---

### 💡 Why this approach?
*   **Portability:** No admin rights needed; Neovim runs entirely from a user-owned folder.
