return {
  {
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
      },
      keys = {
        {
          '<leader>fe',
          function()
            require('neo-tree.command').execute { toggle = true }
          end,
          desc = 'Explorer NeoTree',
        },
        {
          '<leader>ge',
          function()
            require('neo-tree.command').execute { source = 'git_status', toggle = true }
          end,
          desc = 'Git Explorer',
        },
        {
          '<leader>be',
          function()
            require('neo-tree.command').execute { source = 'buffers', toggle = true }
          end,
          desc = 'Buffer Explorer',
        },
        {
          '-',
          function()
            local reval_file = vim.fn.expand '%:p'
            if reval_file == '' then
              reval_file = vim.fn.getcwd()
            else
              local f = io.open(reval_file, 'r')
              if f then
                f.close(f)
              else
                reval_file = vim.fn.getcwd()
              end
            end
            require('neo-tree.command').execute {
              action = 'focus',
              source = 'filesystem',
              position = 'left',
              reveal_file = reval_file,
            }
          end,
          desc = 'Open neo-tree at current file or working directory',
        },
      },
    },
  },
}
