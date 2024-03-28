---@type LazyConfig
return {{
  "Exafunction/codeium.vim",
  -- Enables Codeium on entering a file.
  event = "FileType",

  -- Setups Codeium.
  config = function(_,_)
    -- Accepts a Codeium suggestion.
    vim.keymap.set("i", "<C-a>", function ()
      return vim.fn['codeium#Accept']()
    end, { expr = true, })
  end
}}
