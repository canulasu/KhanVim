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

vim.api.nvim_create_user_command('Python', function()
	local filename = vim.fn.expand('%:p')

    local os_name = vim.loop.os_uname().sysname

    if os_name == 'Windows_NT' then
        vim.cmd('!python3 ' .. filename)
    else
	    vim.cmd('!python3 ' .. filename)
    end

end, {})

vim.api.nvim_create_user_command('C', function()
	local filename = vim.fn.expand('%:p')

    local os_name = vim.loop.os_uname().sysname

    if os_name == 'Linux' then
        vim.cmd('!gcc ' .. filename .. ' -o code')
    elseif os_name == 'Darwin' then 
	    vim.cmd('!clang ' .. filename .. ' -o code')
    else
        vim.print('Your operating system is not yet supported')
        vim.print('Will try to compile with GCC')
        vim.cmd('!gcc ' .. filename .. ' -o code')
    end

	vim.cmd('!./code')
	vim.cmd('!rm code')

end, {})

vim.api.nvim_create_user_command('Rust', function()
	local filename = vim.fn.expand('%:p')

    vim.cmd('!rustc ' .. filename .. ' -o code')
	vim.cmd('!./code')
	vim.cmd('!rm code')

end, {})