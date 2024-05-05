require("dapui").setup()
local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.cpp = {
  {
    type = 'gdb';
    request = 'launch';
    name = "Launch file";
  },
}
