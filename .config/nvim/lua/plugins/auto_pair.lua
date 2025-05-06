return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({}) -- Load default settings

      -- Debugging: Print a message to ensure the plugin is loaded
      print("nvim-autopairs loaded")

      -- Add custom rule for C++ files
      local Rule = require("nvim-autopairs.rule")
      npairs.add_rules({
        Rule("<", ">", "cpp") -- Applies only in C++ files
          :with_pair(function(opts)
            print("<< Rule Triggered") -- Debugging: Print when the rule is triggered
            return opts.line:sub(opts.col - 1, opts.col) == "<<"
          end)
          :use_key("<"), -- Trigger this rule with `<`
      })
    end,
  },
}


