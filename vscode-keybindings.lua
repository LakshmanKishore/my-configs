-- Guard clause: Only apply these mappings when running inside VS Code.
if not vim.g.vscode then
  return
end

-- 1. CRUCIAL FIX: Set the leader key to Space
vim.g.mapleader = " "

local map = vim.keymap.set

-- 2. Helper function to reliably trigger VS Code commands
local function vs(cmd)
  vim.cmd("call VSCodeNotify('" .. cmd .. "')")
end

-- ==========================================
-- Normal Mode Keybindings
-- ==========================================
map('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

map('n', '<Leader>tt', ':tabnew<CR>', { desc = 'New tab' })
map('n', '<Leader>tn', ':tabnext<CR>', { desc = 'Next tab' })
map('n', '<Leader>tp', ':tabprev<CR>', { desc = 'Previous tab' })
map('n', '<Leader>to', ':tabonly<CR>', { desc = 'Close other tabs' })
map('n', '<Leader>tc', ':tabclose<CR>', { desc = 'Close current tab' })

map('n', '<Leader>/', ':nohlsearch<CR>', { desc = 'Clear search highlight' })

-- VS Code Actions
map('n', '<Leader>s', function() vs('workbench.action.files.save') end, { desc = 'Save file' })
map('n', '<Leader>p', function() vs('workbench.action.showCommands') end, { desc = 'Show all commands' })
map('n', '<Leader>f', function() vs('workbench.action.quickOpen') end, { desc = 'Quick open file' })
map('n', '<Leader>o', function() vs('workbench.action.gotoSymbol') end, { desc = 'Go to symbol' })
map('n', '<Leader>j', function() vs('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup') end, { desc = 'Recent editor' })

map('n', '<Leader>c', function() vs('editor.action.clipboardCopyAction') end, { desc = 'Copy' })
map('n', '<Leader>v', function() vs('editor.action.clipboardPasteAction') end, { desc = 'Paste' })
map('n', '<Leader>x', function() vs('editor.action.clipboardCutAction') end, { desc = 'Cut' })

map('n', '<Leader>ej', function() vs('editor.action.marker.nextInFiles') end, { desc = 'Next problem' })
map('n', '<Leader>ek', function() vs('editor.action.marker.prevInFiles') end, { desc = 'Previous problem' })

map('n', '<Leader>a', function()
  vs('editor.action.selectAll')
  vs('editor.action.clipboardCopyAction')
  vs('workbench.action.navigateBack')
end, { desc = 'Select all, copy, and navigate back' })

map('n', '<Leader>r', function() vs('workbench.action.debug.restart') end, { desc = 'Restart debug' })

map('n', '<C-i>', function() vs('interactiveEditor.start') end, { desc = 'Start interactive editor' })
map('n', '<Leader>gh', function() vs('workbench.action.quickchat.toggle') end, { desc = 'Toggle quick chat' })


-- ==========================================
-- Visual Mode Keybindings
-- ==========================================
map('v', '<Leader>c', function() vs('editor.action.clipboardCopyAction') end, { desc = 'Copy' })
map('v', '<Leader>v', function() vs('editor.action.clipboardPasteAction') end, { desc = 'Paste' })
map('v', '<Leader>x', function() vs('editor.action.clipboardCutAction') end, { desc = 'Cut' })
map('v', '<C-i>', function() vs('interactiveEditor.start') end, { desc = 'Start interactive editor' })
map('v', '<Leader>gh', function() vs('workbench.action.quickchat.toggle') end, { desc = 'Toggle quick chat' })


-- ==========================================
-- Operator Pending Mode Keybindings
-- ==========================================
map('o', 'l', '$', { desc = 'End of line' })
map('o', 'h', '^', { desc = 'Beginning of line' })
