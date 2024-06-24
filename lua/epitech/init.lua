
local M = {}

local function createHeader()
    local file_extension = vim.fn.expand("%:e")
    local valid_extensions = { c = true, h = true, Makefile = true, cpp = true, hpp = true }

    if not valid_extensions[file_extension] then
        vim.api.nvim_err_writeln("Error: File extension not valid")
        return
    end

    local filename = vim.fn.expand("%:t")
    local year = os.date("%Y")
    local description = vim.fn.input("Enter Description: ")

    local header_template = nil
    if file_extension == "Makefile" then
        header_template = string.format("##\n## EPITECH PROJECT, %s\n## %s\n## File description:\n## %s\n##\n", year, filename, description)
    else
        header_template = string.format("/*\n** EPITECH PROJECT, %s\n** %s\n** File description:\n** %s\n*/\n", year, filename, description)
    end

    vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header_template, '\n'))
end

function M.setup(opts)
    opts = opts or {}
    vim.api.nvim_create_user_command("EpitechHeader", createHeader, {})
    vim.keymap.set('n', '<Leader>he', createHeader, {
        noremap = true,
        desc = "shortcut insert epitech header"
    })
end

return M
