-- set proxy for vim and its child process
vim.env.https_proxy = 'http://127.0.0.1:8123'
vim.env.http_proxy = 'http://127.0.0.1:8123'
require('krys.settings')

require("krys.lazy")
require("krys.remap")
-- require("krys.util")
