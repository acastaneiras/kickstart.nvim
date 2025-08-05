local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local snippets = {
  s(
    'rafce',
    fmt(
      [[
    import React from 'react';

    const {} = () => {{
      return (
        <div>{}</div>
      );
    }}

    export default {};
  ]],
      {
        i(1, 'ComponentName'),
        i(2, ''),
        rep(1),
      }
    )
  ),
}
ls.add_snippets('javascriptreact', snippets)
ls.add_snippets('typescriptreact', snippets)
