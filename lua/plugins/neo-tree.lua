return {

  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  keys = {
    {
      '<leader>e',
      ':Neotree toggle float<CR>',
      silent = true,
      desc = 'Float File Explorer',
    },
  },

  config = function()
    vim.fn.sign_define(
      'DiagnosticSignError',
      { text = ' ', texthl = 'DiagnosticSignError' }
    )
    vim.fn.sign_define(
      'DiagnosticSignWarn',
      { text = ' ', texthl = 'DiagnosticSignWarn' }
    )
    vim.fn.sign_define(
      'DiagnosticSignInfo',
      { text = ' ', texthl = 'DiagnosticSignInfo' }
    )
    vim.fn.sign_define(
      'DiagnosticSignHint',
      { text = '󰌵 ', texthl = 'DiagnosticSignHint' }
    )

    require('neo-tree').setup({
      close_if_last_window = true,
      popup_border_style = 'single',
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {

        indent = {
          with_markers = true,

          with_expanders = true,
        },
        modified = {
          symbol = ' ',
          highlight = 'NeoTreeModified',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '󰜌',
        },
        git_status = {
          symbols = {
            added = '  ',
            modified = '  ',
            deleted = '✖ ',
            renamed = '󰁕 ',
            -- Status type
            untracked = ' ',
            ignored = ' ',
            unstaged = '󰄱 ',
            staged = ' ',
            conflict = ' ',
          },
        },
      },
      window = {

        position = 'float',

        width = 40,
        mappings = {

          ['h'] = function(state)
            local node = state.tree:get_node()
            if node.type == 'directory' and node:is_expanded() then
              require('neo-tree.sources.filesystem').toggle_directory(
                state,
                node
              )
            else
              require('neo-tree.ui.renderer').focus_node(
                state,
                node:get_parent_id()
              )
            end
          end,
          ['l'] = function(state)
            local node = state.tree:get_node()
            if node.type == 'directory' then
              if not node:is_expanded() then
                require('neo-tree.sources.filesystem').toggle_directory(
                  state,
                  node
                )
              elseif node:has_children() then
                require('neo-tree.ui.renderer').focus_node(
                  state,
                  node:get_child_ids()[1]
                )
              end
            end
          end,
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            'node_modules',
          },

          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
          follow_current_file = {
            enabled = true,
          },
        },
      },
      event_handlers = {
        {
          event = 'file_opened',
          handler = function()
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require('neo-tree.command').execute({ action = 'close' })
          end,
        },
        {
          event = 'neo_tree_window_after_open',
          handler = function(args)
            if args.position == 'left' or args.position == 'right' then
              vim.cmd('wincmd =')
            end
          end,
        },
        {
          event = 'neo_tree_window_after_close',
          handler = function(args)
            if args.position == 'left' or args.position == 'right' then
              vim.cmd('wincmd =')
            end
          end,
        },
      },
    })
  end,
}
