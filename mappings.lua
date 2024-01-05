local M = {}

-- In order to disable a default keymap, use
-- M.disabled = {
--   n = {
--       ["<A-i>"] = ""
--   }
-- }
--
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
      {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  }
}

M.toggleterm = {
  plugin = false,
  t = {
    ["<C-\\>"] = {
      function ()
        require('toggleterm').toggle()
      end,
      "Toggle terminal",
       {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
  },
  n = {
    ["<A-i>"] = {
      function ()
        require('toggleterm').toggle(nil, nil, nil, 'float')
      end,
      "New float terminal",
       {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    },
    ["<A-h>"] = {
      function ()
        require('toggleterm').toggle(nil, nil, nil, 'horizontal')
      end,
      "New horizontal terminal",
       {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
    }
 }
}
return M
