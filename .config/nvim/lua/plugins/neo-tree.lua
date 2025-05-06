return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      -- Keybinding for Neo-tree
      vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')

      -- Initialize previous directory stack safely
      local previous_cwd_stack = {}

      -- Function to push current directory onto the stack
      local function push_directory_to_stack()
        table.insert(previous_cwd_stack, vim.fn.getcwd())
      end

      -- Function to go back to the previous directory
      local function go_back_to_previous_directory()
        if #previous_cwd_stack > 0 then
          local prev_cwd = table.remove(previous_cwd_stack)
          vim.cmd("cd " .. prev_cwd)
          print("Returned to: " .. prev_cwd)
        else
          print("No previous directory to go back to!")
        end
      end

      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true,
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = true,
        },
        event_handlers = {
          -- Event handler when a file is opened
          {
            event = "file_opened",
            handler = function(file_path)
              push_directory_to_stack() -- Push current directory before changing
              local dir = vim.fn.fnamemodify(file_path, ":h")
              if vim.fn.isdirectory(dir) == 1 then
                vim.cmd("cd " .. dir)
              end
            end,
          },

          -- Event handler when entering Neo-tree buffer
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              push_directory_to_stack() -- Push current directory before changing
              local ok, state = pcall(require, "neo-tree.sources.manager")
              if ok and state then
                local fs_state = state.get_state("filesystem")
                if fs_state and fs_state.tree then
                  local node = fs_state.tree:get_node()
                  if node and node.type == "directory" and vim.fn.isdirectory(node.path) == 1 then
                    vim.cmd("cd " .. node.path)
                  end
                end
              end
            end,
          },
        },
      })

      -- Keybinding to go back to the previous directory
      vim.keymap.set('n', '<leader>p', function()
        go_back_to_previous_directory()
      end, { noremap = true, silent = true })
    end,
  }
}

