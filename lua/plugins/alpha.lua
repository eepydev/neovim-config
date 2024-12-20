return   {
    "goolord/alpha-nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
"                   ▄ ▄                              ",
"               ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄                ",
"               █ ▄ █▄█ ▄▄▄ █ █▄█ █ █                ",
"            ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █                ",
"          ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄             ",
"          █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄           ",
"        ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █           ",
"        █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █           ",
"            █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█               ",
}

    dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $HOME/ | Telescope find_files<CR>"),
    dashboard.button( "t", "󰍉  > Find text", ":Telescope live_grep <CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles <CR>"),
    dashboard.button( "l", "󰒲  > Lazy "    , ":Lazy<CR>"),
    dashboard.button( "m", "󱁤  > Mason"    , ":Mason<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
    }


-- Plugins and time taken to loaded
 vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local version = "  󰥱 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
         local plugins = "⚡Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          local footer = version .. "\t" .. plugins .. "\n"
          dashboard.section.footer.val = footer
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

-- Qoute
--dashboard.section.footer.val =
--        'Now I will have less distraction.\n- Leonhard Euler'
--      dashboard.section.footer.opts.hl = '@alpha.footer'
--      table.insert(dashboard.config.layout, 5, {
--        type = 'padding',
--        val = 1,
--      })

      alpha.setup(dashboard.opts)
    end,
  }
