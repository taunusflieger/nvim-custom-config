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
local opts = { silent = true }
M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates(opts)
      end,
      "update crates"
    },
    ["<leader>rct"] = {
      function ()
        require('crates').toggle(opts)
      end,
      "toggle crates version display"
    },
    ["<leader>rcr"] = {
      function ()
        require('crates').reload(opts)
      end,
      "reload crates"
    },
    ["<leader>rcf"] = {
      function ()
        require('crates').show_features_popup(opts)
        require('crates').focus_popup(1)
      end,
      "show features popup"
    },
    ["<leader>rcD"] = {
      function ()
        require('crates').open_documentation(opts)
      end,
      "reload crates"
    },

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
