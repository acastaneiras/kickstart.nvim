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

  s(
    'usestate',
    fmt(
      [[
const [{}, {}] = useState({});

    ]],
      {
        i(1, 'state'),
        i(2, 'setState'),
        i(3, "''"),
      }
    )
  ),
  s(
    'useeffect',
    fmt(
      [[
useEffect(() => {{
  {}
}}, [{}]);
    ]],
      {
        i(1, '// effect code'),
        i(2, ''),
      }
    )
  ),
}
ls.add_snippets('javascriptreact', snippets)
ls.add_snippets('typescriptreact', snippets)
