if vim.g.loaded_epitech then
  return
end
vim.g.loaded_epitech = true

require('epitech').setup()
