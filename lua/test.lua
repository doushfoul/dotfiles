local servers = require'lspinstall'.installed_servers()

for _, server in pairs(servers) do
  print('ola')
  print(server)
end
