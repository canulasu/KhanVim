vim.cmd('syntax on')
vim.cmd('colorscheme ron')

vim.opt.mouse = 'a'

vim.cmd('belowright split')
vim.cmd('resize 10')
vim.cmd('terminal')
vim.cmd('startinsert')

vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
	pattern="term://*",
	callback=function()
		vim.cmd("startinsert")
		vim.bo.modifiable=true
	end,
})

-- Load builtin plugins
dofile(vim.fn.getcwd() .. "/coderunner.lua")
