-- Thanks to https://github.com/faerryn/plogins.nvim --

local function manage_plugins()
    local plugins = {
        ["https://github.com/faerryn/plogins.nvim.git"] = {},

        -- Used for setting up configs here --
        ["https://github.com/navarasu/onedark.nvim.git"] = {
            packadd_hook = function()
                vim.cmd([[colorscheme onedark]])
            end,
        },
    }

    local manager = require("plogins").manage(plugins)

    vim.api.nvim_create_user_command("PloginsUpgrade", manager.upgrade, {})
    vim.api.nvim_create_user_command("PloginsAutoremove", manager.autoremove, {})
end

local plogins_source = "https://github.com/faerryn/plogins.nvim.git"
local plogins_name = plogins_source:gsub("/", "%%")
local plogins_dir = ("%s/site/pack/plogins/opt/%s"):format((vim.fn.stdpath("data")), plogins_name)

if not vim.loop.fs_stat(plogins_dir) then
    vim.loop.spawn("git", { args = { "clone", "--depth", "1", plogins_source, plogins_dir } }, function()
        vim.defer_fn(function()
            vim.cmd(("packadd %s"):format(vim.fn.fnameescape(plogins_name)))
            manage_plugins()
        end, 0)
    end)
else
    vim.cmd(("packadd %s"):format(vim.fn.fnameescape(plogins_name)))
    manage_plugins()
end
