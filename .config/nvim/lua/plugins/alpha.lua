return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Custom Header (Your ASCII Art)
    dashboard.section.header.val = {
      [[██████████    ███                                                           ]],
      [[░░███░░░░███  ░░░                                                            ]],
      [[ ░███   ░░███ ████  ████████   █████ ████                                    ]],
      [[ ░███    ░███░░███ ░░███░░███ ░░███ ░███                                     ]],
      [[ ░███    ░███ ░███  ░███ ░███  ░███ ░███                                     ]],
      [[ ░███    ███  ░███  ░███ ░███  ░███ ░███                                     ]],
      [[ ██████████   █████ ████ █████ ░░████████     ██                            ]],
      [[░░░░░░░░░░   ░░░░░ ░░░░ ░░░░░   ░░░░░░░░     ██                              ]],
      [[                                            ░░                               ]],
      [[                                                                             ]],
      [[                                                                            ]],
      [[  █████████             █████    █████                       ███  █████      ]],
      [[ ███░░░░░███           ░░███    ░░███                       ░░░  ░░███        ]],
      [[░███    ░░░   ██████   ███████   ░███████   █████ ███ █████ ████  ░███ █████]],
      [[░░█████████  ░░░░░███ ░░░███░    ░███░░███ ░░███ ░███░░███ ░░███  ░███░░███ ]],
      [[ ░░░░░░░░███  ███████   ░███     ░███ ░███  ░███ ░███ ░███  ░███  ░██████░  ]],
      [[ ███    ░███ ███░░███   ░███ ███ ░███ ░███  ░░███████████   ░███  ░███░░███  ]],
      [[░░█████████ ░░████████  ░░█████  ████ █████  ░░████░████    █████ ████ █████  ]],
      [[ ░░░░░░░░░   ░░░░░░░░    ░░░░░  ░░░░ ░░░░░    ░░░░ ░░░░    ░░░░░ ░░░░ ░░░░░ ]],
    }

    -- Custom Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "📄  New File", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
      dashboard.button("r", "🕑  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "❌  Quit", ":qa<CR>"),
    }

    -- Custom Footer
    dashboard.section.footer.val = {
      "🚀 Code with passion!",
      "🤖 made with my brain",
      "☕️ coffe is important !"
    }

    -- Set up Alpha
    alpha.setup(dashboard.opts)
  end,
}

