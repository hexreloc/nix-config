local obsidian = require("obsidian")

obsidian.setup({
	 note_id_func = function(title)
    if title then
      return title
    end

    local suffix = ""
    for _ = 1, 4 do
      suffix = suffix .. string.char(math.random(65, 90))
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  -- Customize how the file path is generated from the ID/title
  note_path_func = function(spec)
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix(".md")
  end,

  legacy_commands = false,
  workspaces = {
    {
      name = "notes",
      path = "~/personal/brain",
    },
  },
})

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<CR>", {
	desc = "Create and open new note",
})

vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian today<CR>", {
	desc = "Open todays note",
})

vim.keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday <CR>", {
	desc = "Open yesterday note",
})

vim.keymap.set("n", "<leader>oT", "<cmd>Obsidian tomorrow <CR>", {
	desc = "Open tomorrow note",
})

vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<CR>", {
	desc = "Paste image in clipboard",
})

vim.keymap.set("n", "<leader>of", "<cmd>Obsidian quick_switch<CR>", {
	desc = "leader ff but for notes",
})
