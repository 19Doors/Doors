local floatState = {
  buf=nil,
  wid=nil,
  open=false,
}
function floatTerm(ops)
  local buf = floatState.buf
  local wid = floatState.wid
  if buf==nil then
    buf = vim.api.nvim_create_buf(false,false);
    floatState.buf=buf;
  end
  local width = math.floor(vim.o.columns*0.8);
  local height = math.floor(vim.o.lines*0.8);
  local col = math.floor((vim.o.columns-width)/2)
  local row = math.floor((vim.o.lines-height)/2)
  if not wid then
    wid = vim.api.nvim_open_win(buf,true,{relative='win', width=width, height=height, row=row, col=col, border="rounded"});
    vim.cmd.term();
    floatState.wid=wid
  else
    wid = vim.api.nvim_open_win(buf,true,{relative='win', width=width, height=height, row=row, col=col, border="rounded"});
    floatState.wid=wid
  end
end

vim.keymap.set('n', '<leader>t', function()
  if floatState.open then
    vim.api.nvim_win_hide(floatState.wid);
    floatState.open=false;
  else
    floatState.open=true;
    floatTerm()
  end
end)
